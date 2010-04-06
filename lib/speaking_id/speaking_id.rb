module SpeakingId
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module  ClassMethods
    def has_slug(source, options = {})
      speaking_id(options)

      class_inheritable_accessor :slug_source

      self.slug_source = source

      before_save :create_slug
    end

    def has_random_slug(options = {})
      speaking_id(options)

      before_create :create_random_slug
    end

    def speaking_id(options = {})
      send :include, InstanceMethods

      class_inheritable_accessor :slug_column

      self.slug_column = (options[:column] || :slug).to_s

      validates_uniqueness_of self.slug_column
    end

    send :protected, :speaking_id
  end

  module InstanceMethods
    def create_slug
      # Only creates a slug when the Active Record object is unsaved or got changed.
      return unless self.instance_eval("#{self.slug_source}_changed?")

      begin
        # Normalizes the slug source column or creates a random slug when blank.
        self[self.slug_column] = self[self.slug_source].normalize
        return create_random_slug if self[self.slug_column].blank?
        
        self[self.slug_column] << ((counter ||= 1) == 1 ? nil : counter).to_s
        counter += 1
      end while slug_taken?
    end

    def create_random_slug
      begin
        self[self.slug_column] = create_random_token
      end while slug_taken?
    end

    def to_param
      self[self.slug_column]
    end

    private

    def create_random_token(limit = 3)
      ActiveSupport::SecureRandom.hex(limit).upcase
    end

    def slug_taken?
      if Rails::VERSION::MAJOR == 2
        self.class.first :conditions => {self.slug_column.to_sym => self[self.slug_column]}
      else
        self.class.where(self.slug_column => self[self.slug_column]).first
      end
    end
  end
end

ActiveRecord::Base.send :include, SpeakingId
