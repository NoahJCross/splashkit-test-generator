uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestAcceptAllNewConnectionsIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    connectionsAccepted := accept_all_new_connections();
    AssertTrue(connectionsAccepted);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestAcceptNewConnectionIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    connectionAccepted := accept_new_connection(testServer);
    AssertTrue(connectionAccepted);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestBroadcastMessageIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection1 := open_connection("client1", "127.0.0.1", 5000);
    testConnection2 := open_connection("client2", "127.0.0.1", 5000);
    broadcast_message("Test Message", testServer);
    check_network_activity();
    AssertTrue(has_messages(testConnection1));
    AssertTrue(has_messages(testConnection2));
    close_connection(testConnection1);
    close_connection(testConnection2);
    close_server(testServer);
end;
procedure TIntegrationTests.TestBroadcastMessageToAllIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    broadcast_message("Test Message");
    check_network_activity();
    AssertTrue(has_messages(testConnection));
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestBroadcastMessageToServerNamedIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    broadcast_message("Test Message", "test_server");
    check_network_activity();
    AssertTrue(has_messages(testConnection));
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestCheckNetworkActivityIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    AssertTrue(has_new_connections());
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestClearMessagesFromNameIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    AssertTrue(has_messages(testConnection));
    clear_messages("test_connection");
    check_network_activity();
    AssertFalse(has_messages(testConnection));
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestClearMessagesFromConnectionIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    AssertTrue(has_messages(testConnection));
    clear_messages(testConnection);
    AssertFalse(has_messages(testConnection));
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestClearMessagesFromServerIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 8080);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    AssertTrue(has_messages(testServer));
    clear_messages(testServer);
    check_network_activity();
    AssertFalse(has_messages(testServer));
    close_server(testServer);
end;
procedure TIntegrationTests.TestCloseAllConnectionsIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    AssertTrue(has_connection("test_connection"));
    close_all_connections();
    check_network_activity();
    AssertFalse(has_connection("test_connection"));
    close_server(testServer);
end;
procedure TIntegrationTests.TestCloseAllServersIntegration;
begin
    testServer1 := create_server("test_server_1", 5000);
    testServer2 := create_server("test_server_2", 5001);
    server1Exists := has_server("test_server_1");
    server2Exists := has_server("test_server_2");
    AssertTrue(server1Exists);
    AssertTrue(server2Exists);
    close_all_servers();
    server1Closed := has_server("test_server_1");
    server2Closed := has_server("test_server_2");
    AssertFalse(server1Closed);
    AssertFalse(server2Closed);
end;
procedure TIntegrationTests.TestCloseConnectionIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 8080);
    closeResult := close_connection(testConnection);
    AssertTrue(closeResult);
    isOpen := is_connection_open(testConnection);
    AssertFalse(isOpen);
    close_all_connections();
end;
procedure TIntegrationTests.TestCloseConnectionNamedIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 8080);
    testIsOpen := is_connection_open(testConnection);
    AssertTrue(testIsOpen);
    testResult := close_connection("test_connection");
    AssertTrue(testResult);
    testIsOpen := is_connection_open(testConnection);
    AssertFalse(testIsOpen);
end;
procedure TIntegrationTests.TestCloseMessageIntegration;
begin
    testMessage := read_message();
    close_message(testMessage);
    AssertTrue(has_messages());
end;
procedure TIntegrationTests.TestCloseServerNamedIntegration;
begin
    testServer := create_server("test_server", 5000);
    closeResult := close_server("test_server");
    AssertTrue(closeResult);
    serverExists := has_server("test_server");
    AssertFalse(serverExists);
end;
procedure TIntegrationTests.TestCloseServerIntegration;
begin
    testServer := create_server("test_server", 5000);
    closeResult := close_server(testServer);
    AssertTrue(closeResult);
    serverExists := has_server("test_server");
    AssertFalse(serverExists);
end;
procedure TIntegrationTests.TestConnectionCountNamedIntegration;
begin
    testServer := create_server("test_server", 5000);
    open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    AssertEquals(connection_count("test_server"), 1);
    close_all_connections();
    close_server(testServer);
end;
procedure TIntegrationTests.TestConnectionCountIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    AssertEquals(connection_count(testServer), 1);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestConnectionIPIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    testIP := connection_ip(testConnection);
    AssertEquals(testIP, 2130706433);
    close_connection(testConnection);
end;
procedure TIntegrationTests.TestConnectionIPFromNameIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 8080);
    testIP := connection_ip("test_connection");
    AssertNotEquals(testIP, 0);
    close_connection(testConnection);
end;
procedure TIntegrationTests.TestConnectionNamedIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    retrievedConnection := connection_named("test_connection");
    AssertNotNull(retrievedConnection);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestConnectionPortIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    testPort := connection_port(testConnection);
    AssertEquals(testPort, 5000);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestConnectionPortFromNameIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    testPort := connection_port("test_connection");
    AssertEquals(testPort, 5000);
    close_connection(testConnection);
end;
procedure TIntegrationTests.TestCreateServerWithPortIntegration;
begin
    testServer := create_server("test_server", 5000);
    AssertNotNull(testServer);
    close_server(testServer);
end;
procedure TIntegrationTests.TestCreateServerWithPortAndProtocolIntegration;
begin
    testServer := create_server("test_server", 5000, ConnectionType.TCP);
    AssertNotNull(testServer);
    serverExists := has_server("test_server");
    AssertTrue(serverExists);
    close_server(testServer);
end;
procedure TIntegrationTests.TestDecToHexIntegration;
begin
    testHexResult := dec_to_hex(2130706433);
    AssertEquals(testHexResult, "0x7F000001");
end;
procedure TIntegrationTests.TestFetchNewConnectionIntegration;
begin
    testServer := create_server("test_server", 5000);
    open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    newConnection := fetch_new_connection(testServer);
    AssertNotNull(newConnection);
    close_connection(newConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestHasConnectionIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 8080);
    AssertTrue(has_connection("test_connection"));
    close_connection(testConnection);
    AssertFalse(has_connection("test_connection"));
end;
procedure TIntegrationTests.TestHasMessagesIntegration;
begin
    testResult := has_messages();
    AssertFalse(testResult);
    send_message_to("test_message", open_connection("test_connection", "127.0.0.1", 5000));
    testResult := has_messages();
    AssertTrue(testResult);
    close_all_connections();
end;
procedure TIntegrationTests.TestHasMessagesOnConnectionIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    AssertTrue(has_messages(testConnection));
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestHasMessagesOnNameIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    AssertTrue(has_messages("test_server"));
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestHasMessagesOnServerIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    AssertTrue(has_messages(testServer));
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestHasNewConnectionsIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    AssertTrue(has_new_connections());
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestHasServerIntegration;
begin
    testServer := create_server("test_server", 5000);
    AssertTrue(has_server("test_server"));
    close_server(testServer);
    AssertFalse(has_server("test_server"));
end;
procedure TIntegrationTests.TestHexStrToIpv4Integration;
begin
    testIpv4 := hex_str_to_ipv4("0x7F000001");
    AssertEquals(testIpv4, "127.0.0.1");
    testIpv4NoPrefix := hex_str_to_ipv4("7F000001");
    AssertEquals(testIpv4NoPrefix, "127.0.0.1");
end;
procedure TIntegrationTests.TestHexToDecStringIntegration;
begin
    testResult := hex_to_dec_string("7F");
    AssertEquals(testResult, "127");
    testResultWithPrefix := hex_to_dec_string("0x7F");
    AssertEquals(testResultWithPrefix, "127");
end;
procedure TIntegrationTests.TestIpv4ToDecIntegration;
begin
    testResult := ipv4_to_dec("127.0.0.1");
    AssertEquals(testResult, 2130706433);
    testResult := ipv4_to_dec("192.168.1.1");
    AssertEquals(testResult, 3232235777);
end;
procedure TIntegrationTests.TestIpv4ToHexIntegration;
begin
    testIpv4Hex := ipv4_to_hex("127.0.0.1");
    AssertEquals(testIpv4Hex, "0x7F000001");
end;
procedure TIntegrationTests.TestIpv4ToStrIntegration;
begin
    testIPStr := ipv4_to_str(2130706433);
    AssertEquals(testIPStr, "127.0.0.1");
end;
procedure TIntegrationTests.TestIsConnectionOpenIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    AssertTrue(is_connection_open(testConnection));
    close_connection(testConnection);
    AssertFalse(is_connection_open(testConnection));
    close_server(testServer);
end;
procedure TIntegrationTests.TestIsConnectionOpenFromNameIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    AssertTrue(is_connection_open("test_connection"));
    close_connection(testConnection);
    check_network_activity();
    AssertFalse(is_connection_open("test_connection"));
    close_server(testServer);
end;
procedure TIntegrationTests.TestLastConnectionNamedIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    lastConn := last_connection("test_server");
    AssertNotNull(lastConn);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestLastConnectionIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    lastConn := last_connection(testServer);
    AssertEquals(connection_port(lastConn), 5000);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestMessageConnectionIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    testMessage := read_message(testServer);
    AssertEquals(message_connection(testMessage), testConnection);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestMessageCountOnServerIntegration;
begin
    testServer := create_server("test_server", 5000);
    send_message_to("Test Message", open_connection("test_connection", "127.0.0.1", 5000));
    process_events();
    AssertEquals(message_count(testServer), 1);
    close_server(testServer);
end;
procedure TIntegrationTests.TestMessageCountOnConnectionIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    process_events();
    AssertTrue(message_count(testConnection) > 0);
    close_connection(testConnection);
end;
procedure TIntegrationTests.TestMessageCountFromNameIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    AssertEquals(message_count("test_server"), 1);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestMessageDataIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    testMessage := read_message(testServer);
    AssertEquals(message_data(testMessage), "Test Message");
    close_message(testMessage);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestMessageDataBytesIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Hello, World!", testConnection);
    check_network_activity();
    testMessage := read_message(testServer);
    testMessageBytes := message_data_bytes(testMessage);
    AssertEquals(message_data(testMessage), "Hello, World!");
    close_message(testMessage);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestMessageHostIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    testMessage := read_message(testServer);
    AssertEquals(message_host(testMessage), "127.0.0.1");
    close_message(testMessage);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestMessagePortIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    testMessage := read_message(testServer);
    AssertEquals(message_port(testMessage), 5000);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestMessageProtocolIntegration;
begin
    testServer := create_server("test_server", 5000, ConnectionType.UDP);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000, ConnectionType.UDP);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    testMessage := read_message(testServer);
    AssertEquals(message_protocol(testMessage), ConnectionType.UDP);
    close_message(testMessage);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestMyIPIntegration;
begin
    testIP := my_ip();
    AssertEquals(testIP, "127.0.0.1");
end;
procedure TIntegrationTests.TestNameForConnectionIntegration;
begin
    testConnectionName := name_for_connection("localhost", 8080);
    AssertEquals(testConnectionName, "localhost:8080");
end;
procedure TIntegrationTests.TestNewConnectionCountIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    AssertTrue(new_connection_count(testServer) > 0);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestOpenConnectionIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 8080);
    AssertNotNull(testConnection);
    connectionStatus := is_connection_open(testConnection);
    AssertTrue(connectionStatus);
    close_connection(testConnection);
    connectionStatus := is_connection_open(testConnection);
    AssertFalse(connectionStatus);
end;
procedure TIntegrationTests.TestOpenConnectionWithProtocolIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 5000, ConnectionType.TCP);
    AssertNotNull(testConnection);
    close_connection(testConnection);
end;
procedure TIntegrationTests.TestReadMessageIntegration;
begin
    testMessage := read_message();
    AssertNotNull(testMessage);
    close_message(testMessage);
end;
procedure TIntegrationTests.TestReadMessageFromConnectionIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    testMessage := read_message(testConnection);
    AssertEquals(message_data(testMessage), "Test Message");
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestReadMessageFromNameIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", "test_server");
    check_network_activity();
    testMessage := read_message("test_server");
    AssertEquals(message_data(testMessage), "Test Message");
    close_message(testMessage);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestReadMessageFromServerIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    testMessage := read_message(testServer);
    AssertEquals(message_data(testMessage), "Test Message");
    close_connection(testConnection);
    close_server(testServer);
    close_message(testMessage);
end;
procedure TIntegrationTests.TestReadMessageDataFromNameIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    testMessageData := read_message_data("test_server");
    AssertEquals(testMessageData, "Test Message");
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestReadMessageDataFromConnectionIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    process_events();
    testMessageData := read_message_data(testConnection);
    AssertEquals(testMessageData, "Test Message");
    close_connection(testConnection);
end;
procedure TIntegrationTests.TestReadMessageDataFromServerIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    send_message_to("Test Message", testConnection);
    check_network_activity();
    testMessageData := read_message_data(testServer);
    AssertEquals(testMessageData, "Test Message");
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestReconnectIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    close_connection(testConnection);
    reconnect(testConnection);
    AssertTrue(is_connection_open(testConnection));
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestReconnectFromNameIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    close_connection(testConnection);
    reconnect("test_connection");
    AssertTrue(is_connection_open("test_connection"));
    close_server(testServer);
    close_connection(testConnection);
end;
procedure TIntegrationTests.TestReleaseAllConnectionsIntegration;
begin
    testConnection := open_connection("test_connection", "127.0.0.1", 8080);
    connectionExists := has_connection("test_connection");
    AssertTrue(connectionExists);
    release_all_connections();
    connectionExistsAfterRelease := has_connection("test_connection");
    AssertFalse(connectionExistsAfterRelease);
end;
procedure TIntegrationTests.TestResetNewConnectionCountIntegration;
begin
    testServer := create_server("test_server", 5000);
    open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    AssertTrue(new_connection_count(testServer) > 0);
    reset_new_connection_count(testServer);
    AssertEquals(new_connection_count(testServer), 0);
    close_server(testServer);
end;
procedure TIntegrationTests.TestRetrieveConnectionNamedIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    retrievedConnection := retrieve_connection("test_server", 0);
    AssertNotNull(retrievedConnection);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestRetrieveConnectionIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    retrievedConnection := retrieve_connection(testServer, 0);
    AssertNotNull(retrievedConnection);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestSendMessageToConnectionIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    sendResult := send_message_to("Test Message", testConnection);
    AssertTrue(sendResult);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestSendMessageToNameIntegration;
begin
    testServer := create_server("test_server", 5000);
    testConnection := open_connection("test_connection", "127.0.0.1", 5000);
    sendResult := send_message_to("Hello, Server!", "test_connection");
    AssertTrue(sendResult);
    close_connection(testConnection);
    close_server(testServer);
end;
procedure TIntegrationTests.TestServerHasNewConnectionNamedIntegration;
begin
    testServer := create_server("test_server", 5000);
    open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    AssertTrue(server_has_new_connection("test_server"));
    close_server(testServer);
    close_all_connections();
end;
procedure TIntegrationTests.TestServerHasNewConnectionIntegration;
begin
    testServer := create_server("test_server", 5000);
    open_connection("test_connection", "127.0.0.1", 5000);
    check_network_activity();
    AssertTrue(server_has_new_connection(testServer));
    close_server(testServer);
    close_all_connections();
end;
procedure TIntegrationTests.TestServerNamedIntegration;
begin
    testServer := create_server("test_server", 5000);
    retrievedServer := server_named("test_server");
    AssertNotNull(retrievedServer);
    close_server(testServer);
end;
procedure TIntegrationTests.TestSetUDPPacketSizeIntegration;
begin
    set_udp_packet_size(1024);
    AssertEquals(udp_packet_size(), 1024);
end;
procedure TIntegrationTests.TestUDPPacketSizeIntegration;
begin
    testPacketSize := udp_packet_size();
    AssertTrue(testPacketSize > 0);
end;
procedure TIntegrationTests.TestDownloadBitmapIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := download_bitmap("test_image", "http://example.com/test_image.png", 80);
    draw_bitmap(testBitmap, 0, 0);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, 50, 50));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDownloadFontIntegration;
begin
    testFont := download_font("test_font", "http://example.com/font.ttf", 80);
    AssertNotNull(testFont);
    free_font(testFont);
end;
procedure TIntegrationTests.TestDownloadMusicIntegration;
begin
    testMusic := download_music("test_music", "http://example.com/music.mp3", 80);
    AssertNotNull(testMusic);
    free_music(testMusic);
end;
procedure TIntegrationTests.TestDownloadSoundEffectIntegration;
begin
    testSoundEffect := download_sound_effect("test_sound", "http://example.com/test_sound.wav", 80);
    AssertNotNull(testSoundEffect);
    free_sound_effect(testSoundEffect);
end;
procedure TIntegrationTests.TestFreeResponseIntegration;
begin
    testResponse := http_get("http://example.com", 80);
    free_response(testResponse);
    AssertNull(http_response_to_string(testResponse));
end;
procedure TIntegrationTests.TestHttpGetIntegration;
begin
    testResponse := http_get("http://example.com", 80);
    AssertNotNull(testResponse);
    testResponseText := http_response_to_string(testResponse);
    AssertNotEquals(testResponseText, "");
    free_response(testResponse);
end;
procedure TIntegrationTests.TestHttpPostWithHeadersIntegration;
begin
    testResponse := http_post("http://httpbin.org/post", 80, "Test Body", ["Content-Type: application/json", "Accept: application/json"]);
    AssertNotNull(testResponse);
    testResponseString := http_response_to_string(testResponse);
    AssertEquals(stringContains, testResponseString);
    free_response(testResponse);
end;
procedure TIntegrationTests.TestHttpPostIntegration;
begin
    testResponse := http_post("http://example.com", 80, "test=123");
    AssertNotNull(testResponse);
    testResponseString := http_response_to_string(testResponse);
    AssertNotEquals(testResponseString, "");
    free_response(testResponse);
end;
procedure TIntegrationTests.TestHttpResponseToStringIntegration;
begin
    testResponse := http_get("http://example.com", 80);
    testString := http_response_to_string(testResponse);
    AssertNotEquals(testString, "");
    free_response(testResponse);
end;
procedure TIntegrationTests.TestSaveResponseToFileIntegration;
begin
    testResponse := http_get("http://example.com", 80);
    save_response_to_file(testResponse, "test_output.txt");
    free_response(testResponse);
    AssertEquals(fileExists, "test_output.txt");
    delete_file("test_output.txt");
end;
procedure TIntegrationTests.TestHasIncomingRequestsIntegration;
begin
    testServer := start_web_server(8080);
    hasRequests := has_incoming_requests(testServer);
    AssertFalse(hasRequests);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestIsDeleteRequestForIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    AssertFalse(is_delete_request_for(testRequest, "/test_path"));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestIsGetRequestForIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    AssertTrue(is_get_request_for(testRequest, "/test"));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestIsOptionsRequestForIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    testURI := request_uri(testRequest);
    testResult := is_options_request_for(testRequest, testURI);
    AssertTrue(testResult);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestIsPostRequestForIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    isPost := is_post_request_for(testRequest, "/test_path");
    AssertTrue(isPost);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestIsPutRequestForIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    testURI := request_uri(testRequest);
    testResult := is_put_request_for(testRequest, testURI);
    AssertTrue(testResult);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestIsRequestForIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    AssertTrue(is_request_for(testRequest, HttpMethod.GET, "/test"));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestIsTraceRequestForIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    AssertTrue(is_trace_request_for(testRequest, "/trace"));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestNextWebRequestIntegration;
begin
    testServer := start_web_server(8080);
    hasRequests := has_incoming_requests(testServer);
    AssertFalse(hasRequests);
    testRequest := next_web_request(testServer);
    AssertNull(testRequest);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestRequestBodyIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    testBody := request_body(testRequest);
    AssertNotNull(testBody);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestRequestHasQueryParameterIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    testQueryString := request_query_string(testRequest);
    AssertTrue(request_has_query_parameter(testRequest, "param1"));
    AssertFalse(request_has_query_parameter(testRequest, "nonexistent_param"));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestRequestHeadersIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    testHeaders := request_headers(testRequest);
    AssertNotNull(testHeaders);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestRequestMethodIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    AssertNotNull(testRequest);
    testMethod := request_method(testRequest);
    AssertEquals(testMethod, HttpMethod.GET);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestRequestQueryParameterIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    testResult := request_query_parameter(testRequest, "test_param", "default_value");
    AssertEquals(testResult, "default_value");
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestRequestQueryStringIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    testQueryString := request_query_string(testRequest);
    AssertNotNull(testQueryString);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestRequestURIIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    AssertNotNull(testRequest);
    testURI := request_uri(testRequest);
    AssertNotEquals(testURI, "");
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestRequestURIStubsIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    testURI := request_uri(testRequest);
    testStubs := request_uri_stubs(testRequest);
    AssertEquals(split_uri_stubs(testURI), testStubs);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendCSSFileResponseIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    send_css_file_response(testRequest, "test.css");
    AssertTrue(has_incoming_requests(testServer));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendFileResponseIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    send_file_response(testRequest, "testfile.txt", "text/plain");
    AssertTrue(has_incoming_requests(testServer));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendHtmlFileResponseIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    send_html_file_response(testRequest, "test.html");
    AssertTrue(is_request_for(testRequest, HttpMethod.GET, "/test.html"));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendJavascriptFileResponseIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    send_javascript_file_response(testRequest, "test_script.js");
    AssertTrue(has_incoming_requests(testServer));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendResponseEmptyIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    send_response(testRequest);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendResponseIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    send_response(testRequest, "Test Message");
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendResponseJsonWithStatusIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    send_response(testRequest, HttpStatusCode.OK);
    AssertTrue(has_incoming_requests(testServer));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendResponseWithStatusIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    send_response(testRequest, HttpStatusCode.OK, "Test Message");
    AssertTrue(has_incoming_requests(testServer));
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendResponseWithStatusAndContentTypeIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    send_response(testRequest, HttpStatusCode.OK, "Test Message", "text/plain");
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendResponseWithStatusAndContentTypeAndHeadersIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    send_response(testRequest, HttpStatusCode.OK, "Test Message", "text/plain", ["Header1: Value1", "Header2: Value2"]);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSendResponseJsonIntegration;
begin
    testServer := start_web_server(8080);
    testRequest := next_web_request(testServer);
    testJson := create_json();
    json_set_string(testJson, "message", "Hello, World!");
    send_response(testRequest, testJson);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestSplitURIStubsIntegration;
begin
    testStubs := split_uri_stubs("/names/0");
    AssertEquals(testStubs, ["names", "0"]);
    testStubsEmpty := split_uri_stubs("/");
    AssertEquals(testStubsEmpty, []);
end;
procedure TIntegrationTests.TestStartWebServerWithDefaultPortIntegration;
begin
    testServer := start_web_server();
    AssertNotNull(testServer);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestStartWebServerIntegration;
begin
    testServer := start_web_server(8080);
    AssertNotNull(testServer);
    stop_web_server(testServer);
end;
procedure TIntegrationTests.TestStopWebServerIntegration;
begin
    testServer := start_web_server(8080);
    AssertTrue(has_incoming_requests(testServer));
    stop_web_server(testServer);
    AssertFalse(has_incoming_requests(testServer));
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
