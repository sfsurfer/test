class Testsuite
  attr_accessor :results
  attr_reader   :run_time

  def initialize
    @results = []
    @stats   = {
      :pass    => 0,
      :fail    => 0,
      :error   => 0,
      :abort   => 0,
      :skip    => 0,
      :not_run => 0,
    }
    @run_time = {:start => Time.now}
  end

  def add_result(res)
    @results << res
    @stats[res.get_status_str.to_sym] += 1
  end

  def finish
    @run_time[:end] = Time.now
    @run_time[:total] = @run_time[:end] - @run_time[:start]
  end

  def get_results_summary
    "--------------------------\n"+
    " Passed    : #{@stats[:pass]}\n"+
    " Failed    : #{@stats[:fail]}\n"+
    " Error     : #{@stats[:error]}\n"+
    " Abort     : #{@stats[:abort]}\n"+
    " Skipped   : #{@stats[:skip]}\n"+
    " Not Run   : #{@stats[:not_run]}\n"+
    "--------------------------\n"+
  end
end
