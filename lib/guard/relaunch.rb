require 'guard'
require 'guard/plugin'
require 'guard/watcher'

module Guard
  class Relaunch < Plugin

    VERSION = '0.1.0'

    def initialize(opts={})
      @command      = opts[:command]
      @kill_command = opts[:kill_command]
      @to_watch     = opts[:watch]

      UI.info "first launch: #{@command}"
      spawn

      watcher = ::Guard::Watcher.new @to_watch
      opts[:watchers] << watcher
      @watchers, @opts = opts[:watchers], opts
      super
    end

    # main method: do the relaunch

    def relaunch
      @kill_command ? kill_custom : kill
      spawn
    end

    # spawns the process

    def spawn
      @pid = Process.spawn @command
    end

    # two types of killing mode
    # default

    def kill
      Process.kill "KILL", @pid
      Process.wait @pid
    end

    # custom killing mode (you need to specify a :kill_command)
    # TODO: provide a check parameter (to see if the process is killed or not)

    def kill_custom
      `#{@kill_command}`

      begin
        Process.getpgid @pid
      rescue Errno::ESRCH
        # ok, killed
      else
        sleep 0.1
        kill_custom
      end
    end

    # # Call #run_on_change for all files which match this guard.
    # def run_all
    #   run_on_changes(Watcher.match_files(self, Dir.glob('{,**/}*{,.*}').uniq))
    # end

    def run_on_changes(paths)
      relaunch
      UI.info "relaunched: #{@command}"
    end

  end
end
