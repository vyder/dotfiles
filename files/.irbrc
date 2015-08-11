# Woohoo history!
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

# Automatic tabbing
IRB.conf[:AUTO_INDENT] = true

# Autocompletion
require 'irb/completion'

# Gems
gems = []
after_require = {}

# Pretty Print
gems << 'pp'

# Rails-specific
if defined?(::Rails)
    # ActiveRecord tabular print
    gems << 'hirb'
    after_require['hirb'] = Proc.new {
        Hirb.enable
    }
end

# Don't crash just because a gem
# isn't installed
gems.each do |gem_name|
    begin
        require gem_name
        after_require[gem_name].call unless after_require[gem_name].nil?
    rescue LoadError => e
        warn "Oops. Looks like you're missing the #{gem_name} gem."
    end
end

# Aliases
module Kernel

    def clear
        system 'clear'
    end

    def c
        clear
    end

    def q
        exit
    end
end