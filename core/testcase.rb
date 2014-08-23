def run_test(tc,var="",&block)
  result = Result.new(tc,var)
  result.start
  result.instance_eval(&block)
  result.finish
end

def test(name,loop_var=[],&block)
  if loop_var.empty?
    run_test(name,&block)
  else
    loop_var.each { |var| run_test(name,var,&block) }
  end
end
