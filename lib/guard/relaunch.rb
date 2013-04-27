require 'guard'
require 'guard/guard'
require 'guard/watcher'

module Guard
  class Relaunch < Guard

    VERSION = '0.0.1'

    def initialize(watchers=[], opts={})
      @command = opts[:command]
      watcher = ::Guard::Watcher.new regex
      watchers << watcher
      @watchers, @opts = watchers, opts
      super watchers, opts
    end

    # # Calls #run_all if the :all_on_start option is present.
    # def start
    #   run_all if options[:all_on_start]
    # end

    # # Call #run_on_change for all files which match this guard.
    # def run_all
    #   run_on_changes(Watcher.match_files(self, Dir.glob('{,**/}*{,.*}').uniq))
    # end

    def run_on_changes(paths)
      relaunch
      UI.info "Relaunched: #{@command}"
    end

    def relaunch
      content = ""
      files = []
      @opts[:files].each do |file|
        files << "#{@opts[:input_dir]}/#{file}.#{@opts[:type]}"
      end
      files.each do |file|
        content << File.read(file)
        content << "\n"
      end
      File.open(@output, "w"){ |f| f.write content.strip }
    end

  end
end
