require 'i18n/globals/version'

module I18n
  class Config
    def globals
      @@globals ||= {}
    end

    def globals=(globals)
      @@globals = globals
    end
  end

  class << self
    def translate(*args)
      if args.last.is_a?(Hash)
        args[-1] = config.globals.merge(args.last)
      else
        args << config.globals
      end
      
      # Ruby 3 compatible, use double splat for last argument
      options = args.pop
      super(*args, **options)
    end

    alias :t :translate
  end
end
