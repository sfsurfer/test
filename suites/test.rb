require '../core/result'
require '../core/testcase'

myCheck = nil

test "My Test 1" do
  puts "In Demo"
  log "Starting Test 1"
  if myCheck
    pass "Passing Test 1"
  else
    fail "Failing Test"
  end
end

myChecck = 0
myVars = ["1","2"]
test "my loop test", myVars do |tc|
  myVar = tc.loop_var
  log "starting test"
  puts "in loop for #{tc.name}"
  puts "loop var = #{myVar}"
  if myCheck
    pass "Passing Test 1"
  else
    fail "Failing Test"
  end
  print_log
end
