module Kuroko2ReadOnly
  module ApplicationHelper
    def method_missing(method, *args, &block)
      if (method.to_s.end_with?('_path') || method.to_s.end_with?('_url')) && kuroko2.respond_to?(method)
        kuroko2.send(method, *args)
      else
        super
      end
    end
  end
end
