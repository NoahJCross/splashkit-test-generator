uses SplashKit, TestFramework

type
TTestTerminal = class(TTestCase)
protected
procedure TIntegrationTests.TestReadCharIntegration;
begin
    # TODO: Implement io_setup step
    result := ReadChar();
    AssertEquals("A", result);
end;
procedure TIntegrationTests.TestReadLineIntegration;
begin
    # TODO: Implement io_setup step
    result := ReadLine();
    AssertEquals("Test Input", "Test Input");
end;
procedure TIntegrationTests.TestTerminalHasInputIntegration;
begin
    # TODO: Implement io_setup step
    AssertTrue(TerminalHasInput());
end;
procedure TIntegrationTests.TestWriteCharIntegration;
begin
    # TODO: Implement io_setup step
    WriteChar("A");
    AssertEquals("A", "A");
end;
procedure TIntegrationTests.TestWriteDoubleIntegration;
begin
    # TODO: Implement io_setup step
    WriteDouble(3.14);
    AssertEquals("3.14", "3.14");
end;
procedure TIntegrationTests.TestWriteIntIntegration;
begin
    # TODO: Implement io_setup step
    WriteInt(42);
    AssertEquals("42", "42");
end;
procedure TIntegrationTests.TestWriteIntegration;
begin
    # TODO: Implement io_setup step
    Write("Test String");
    AssertEquals("Test String", "Test String");
end;
procedure TIntegrationTests.TestWriteLineCharIntegration;
begin
    # TODO: Implement io_setup step
    WriteLineChar("A");
    AssertEquals({:value_type=>"concat", :value=>["A", "new_line"]}, {:value_type=>"string_with_newline", :value=>"A"});
end;
procedure TIntegrationTests.TestWriteLineEmptyIntegration;
begin
    # TODO: Implement io_setup step
    WriteLineEmpty();
    AssertEquals(Environment.NEW_LINE, {:value_type=>"io_step", :variable_name=>"string_writer", :variable_field=>"to_string"});
end;
procedure TIntegrationTests.TestWriteLineDoubleIntegration;
begin
    # TODO: Implement io_setup step
    WriteLineDouble(3.14);
    AssertEquals({:value_type=>"concat", :value=>["3.14", "new_line"]}, {:value_type=>"string_with_newline", :value=>"3.14"});
end;
procedure TIntegrationTests.TestWriteLineIntIntegration;
begin
    # TODO: Implement io_setup step
    WriteLineInt(42);
    AssertEquals({:value_type=>"concat", :value=>["42", "new_line"]}, {:value_type=>"string_with_newline", :value=>"42"});
end;
procedure TIntegrationTests.TestWriteLineIntegration;
begin
    # TODO: Implement io_setup step
    WriteLine("Test Line");
    AssertEquals({:value_type=>"concat", :value=>["Test Line", "new_line"]}, {:value_type=>"string_with_newline", :value=>"Test Line"});
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f8aefd57268 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:113 (lambda)>
end;
