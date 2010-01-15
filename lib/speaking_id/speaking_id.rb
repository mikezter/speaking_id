module SpeakingId
  module ClassMethods
    def has_slug source, args = {}
      include InstanceMethods

      class_inheritable_accessor :slug_source, :slug_column
      
      self.slug_source = source
      self.slug_column = args.has_key?(:column) ? args[:column] : :slug

      before_save :create_slug
    end

    def has_random_slug args = {}
      include InstanceMethods

      class_inheritable_accessor :slug_column
      
      self.slug_column = args.has_key?(:column) ? args[:column] : :slug

      before_save :create_random_slug
    end
  end

  module InstanceMethods
    def create_slug
      begin
        self[self.slug_column] = self[self.slug_source].to_s.parameterize("_")
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

    def create_random_token limit = 6
      ActiveSupport::SecureRandom.hex(limit).upcase
    end
    
    def slug_taken?
      self.class.first :conditions => {self.slug_column.to_sym => self[self.slug_column]}
    end
  end
end