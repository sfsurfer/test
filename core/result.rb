class Result
  attr_accessor :name, :status, :loop_var
  attr_reader   :run_time, :log

  PASS     =  0
  FAIL     = -1
  ERROR    = -2
  ABORT    = -3
  SKIP     = -4
  NOT_RUN  = -5
  RUNNING  = -6

  def initialize(name, loop_var = "")
    @name     = name
    @status   = NOT_RUN
    @log      = []
    @loop_var = loop_var
    @run_time = Struct.new(:start,:end,:total).new
  end

  def start
    @run_time[:start] = Time.now
    @status = RUNNING
  end

  def finish
    return if @status == NOT_RUN || @status == SKIP
    abort "Test still executing at finish. Aborting" if @status == RUNNING
    @run_time[:end]   = Time.now
    @run_time[:total] = @run_time[:end] - @run_time[:start]
  end

  def log(msg)      ; @log << { :time => Time.now,:msg => msg }; end

  def pass(msg="")  ; @status = PASS ; log msg unless msg == ""; end
  def fail(msg="")  ; @status = FAIL ; log msg unless msg == ""; end
  def skip(msg="")  ; @status = SKIP ; log msg unless msg == ""; end
  def error(msg="") ; @status = ERROR; log msg unless msg == ""; end
  def abort(msg="") ; @status = ABORT; log msg unless msg == ""; end

  def print_log
    @log.each { |msg| puts "#{msg[:time]}: #{msg[:msg]}" }
  end

  def get_status_string
    case @status
    when PASS    ; "pass"
    when FAIL    ; "fail"
    when ERROR   ; "error"
    when ABORT   ; "abort"
    when SKIP    ; "skip"
    when RUNNING ; "running"
    when NOT_RUN ; "not run"
    else         ; "Invalid Status"
    end
  end
end
