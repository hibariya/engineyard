require 'spec_helper'

describe "ey rollback" do
  given "integration"

  def command_to_run(opts)
    cmd = "rollback"
    cmd << " -e #{opts[:env]}" if opts[:env]
    cmd
  end

  def verify_ran(scenario)
    @out.should match(/Rolling back #{scenario[:environment]}/)
    @err.should be_empty
    @ssh_commands.last.should match(/eysd deploy rollback --app #{scenario[:application]}/)
  end

  it_should_behave_like "it takes an environment name"
  it_should_behave_like "it invokes eysd"
end