uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestAcceptAllNewConnectionsIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    connectionsAccepted := AcceptAllNewConnections();
    AssertTrue(connectionsAccepted);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestAcceptNewConnectionIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    connectionAccepted := AcceptNewConnection(testServer);
    AssertTrue(connectionAccepted);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestBroadcastMessageIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection1 := OpenConnection("client1", "127.0.0.1", 5000);
    testConnection2 := OpenConnection("client2", "127.0.0.1", 5000);
    BroadcastMessage("Test Message", testServer);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection1));
    AssertTrue(HasMessages(testConnection2));
    CloseConnection(testConnection1);
    CloseConnection(testConnection2);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestBroadcastMessageToAllIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    BroadcastMessage("Test Message");
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection));
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestBroadcastMessageToServerNamedIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    BroadcastMessage("Test Message", "test_server");
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection));
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestCheckNetworkActivityIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    AssertTrue(HasNewConnections());
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestClearMessagesFromNameIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection));
    ClearMessages("test_connection");
    CheckNetworkActivity();
    AssertFalse(HasMessages(testConnection));
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestClearMessagesFromConnectionIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection));
    ClearMessages(testConnection);
    AssertFalse(HasMessages(testConnection));
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestClearMessagesFromServerIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 8080);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testServer));
    ClearMessages(testServer);
    CheckNetworkActivity();
    AssertFalse(HasMessages(testServer));
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestCloseAllConnectionsIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    AssertTrue(HasConnection("test_connection"));
    CloseAllConnections();
    CheckNetworkActivity();
    AssertFalse(HasConnection("test_connection"));
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestCloseAllServersIntegration;
begin
    testServer1 := CreateServer("test_server_1", 5000);
    testServer2 := CreateServer("test_server_2", 5001);
    server1Exists := HasServer("test_server_1");
    server2Exists := HasServer("test_server_2");
    AssertTrue(server1Exists);
    AssertTrue(server2Exists);
    CloseAllServers();
    server1Closed := HasServer("test_server_1");
    server2Closed := HasServer("test_server_2");
    AssertFalse(server1Closed);
    AssertFalse(server2Closed);
end;
procedure TIntegrationTests.TestCloseConnectionIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 8080);
    closeResult := CloseConnection(testConnection);
    AssertTrue(closeResult);
    isOpen := IsConnectionOpen(testConnection);
    AssertFalse(isOpen);
    CloseAllConnections();
end;
procedure TIntegrationTests.TestCloseConnectionNamedIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 8080);
    testIsOpen := IsConnectionOpen(testConnection);
    AssertTrue(testIsOpen);
    testResult := CloseConnection("test_connection");
    AssertTrue(testResult);
    testIsOpen := IsConnectionOpen(testConnection);
    AssertFalse(testIsOpen);
end;
procedure TIntegrationTests.TestCloseMessageIntegration;
begin
    testMessage := ReadMessage();
    CloseMessage(testMessage);
    AssertTrue(HasMessages());
end;
procedure TIntegrationTests.TestCloseServerNamedIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    closeResult := CloseServer("test_server");
    AssertTrue(closeResult);
    serverExists := HasServer("test_server");
    AssertFalse(serverExists);
end;
procedure TIntegrationTests.TestCloseServerIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    closeResult := CloseServer(testServer);
    AssertTrue(closeResult);
    serverExists := HasServer("test_server");
    AssertFalse(serverExists);
end;
procedure TIntegrationTests.TestConnectionCountNamedIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    AssertEquals(ConnectionCount("test_server"), 1);
    CloseAllConnections();
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestConnectionCountIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    AssertEquals(ConnectionCount(testServer), 1);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestConnectionIPIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    testIP := ConnectionIP(testConnection);
    AssertEquals(testIP, 2130706433);
    CloseConnection(testConnection);
end;
procedure TIntegrationTests.TestConnectionIPFromNameIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 8080);
    testIP := ConnectionIP("test_connection");
    AssertNotEquals(testIP, 0);
    CloseConnection(testConnection);
end;
procedure TIntegrationTests.TestConnectionNamedIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    retrievedConnection := ConnectionNamed("test_connection");
    AssertNotNull(retrievedConnection);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestConnectionPortIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    testPort := ConnectionPort(testConnection);
    AssertEquals(testPort, 5000);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestConnectionPortFromNameIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    testPort := ConnectionPort("test_connection");
    AssertEquals(testPort, 5000);
    CloseConnection(testConnection);
end;
procedure TIntegrationTests.TestCreateServerWithPortIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    AssertNotNull(testServer);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestCreateServerWithPortAndProtocolIntegration;
begin
    testServer := CreateServer("test_server", 5000, ConnectionType.TCP);
    AssertNotNull(testServer);
    serverExists := HasServer("test_server");
    AssertTrue(serverExists);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestDecToHexIntegration;
begin
    testHexResult := DecToHex(2130706433);
    AssertEquals(testHexResult, "0x7F000001");
end;
procedure TIntegrationTests.TestFetchNewConnectionIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    newConnection := FetchNewConnection(testServer);
    AssertNotNull(newConnection);
    CloseConnection(newConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestHasConnectionIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 8080);
    AssertTrue(HasConnection("test_connection"));
    CloseConnection(testConnection);
    AssertFalse(HasConnection("test_connection"));
end;
procedure TIntegrationTests.TestHasMessagesIntegration;
begin
    testResult := HasMessages();
    AssertFalse(testResult);
    SendMessageTo("test_message", OpenConnection("test_connection", "127.0.0.1", 5000));
    testResult := HasMessages();
    AssertTrue(testResult);
    CloseAllConnections();
end;
procedure TIntegrationTests.TestHasMessagesOnConnectionIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection));
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestHasMessagesOnNameIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages("test_server"));
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestHasMessagesOnServerIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testServer));
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestHasNewConnectionsIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    AssertTrue(HasNewConnections());
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestHasServerIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    AssertTrue(HasServer("test_server"));
    CloseServer(testServer);
    AssertFalse(HasServer("test_server"));
end;
procedure TIntegrationTests.TestHexStrToIpv4Integration;
begin
    testIpv4 := HexStrToIpv4("0x7F000001");
    AssertEquals(testIpv4, "127.0.0.1");
    testIpv4NoPrefix := HexStrToIpv4("7F000001");
    AssertEquals(testIpv4NoPrefix, "127.0.0.1");
end;
procedure TIntegrationTests.TestHexToDecStringIntegration;
begin
    testResult := HexToDecString("7F");
    AssertEquals(testResult, "127");
    testResultWithPrefix := HexToDecString("0x7F");
    AssertEquals(testResultWithPrefix, "127");
end;
procedure TIntegrationTests.TestIpv4ToDecIntegration;
begin
    testResult := Ipv4ToDec("127.0.0.1");
    AssertEquals(testResult, 2130706433);
    testResult := Ipv4ToDec("192.168.1.1");
    AssertEquals(testResult, 3232235777);
end;
procedure TIntegrationTests.TestIpv4ToHexIntegration;
begin
    testIpv4Hex := Ipv4ToHex("127.0.0.1");
    AssertEquals(testIpv4Hex, "0x7F000001");
end;
procedure TIntegrationTests.TestIpv4ToStrIntegration;
begin
    testIPStr := Ipv4ToStr(2130706433);
    AssertEquals(testIPStr, "127.0.0.1");
end;
procedure TIntegrationTests.TestIsConnectionOpenIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    AssertTrue(IsConnectionOpen(testConnection));
    CloseConnection(testConnection);
    AssertFalse(IsConnectionOpen(testConnection));
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestIsConnectionOpenFromNameIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    AssertTrue(IsConnectionOpen("test_connection"));
    CloseConnection(testConnection);
    CheckNetworkActivity();
    AssertFalse(IsConnectionOpen("test_connection"));
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestLastConnectionNamedIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    lastConn := LastConnection("test_server");
    AssertNotNull(lastConn);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestLastConnectionIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    lastConn := LastConnection(testServer);
    AssertEquals(ConnectionPort(lastConn), 5000);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestMessageConnectionIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals(MessageConnection(testMessage), testConnection);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestMessageCountOnServerIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    SendMessageTo("Test Message", OpenConnection("test_connection", "127.0.0.1", 5000));
    ProcessEvents();
    AssertEquals(MessageCount(testServer), 1);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestMessageCountOnConnectionIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    ProcessEvents();
    AssertTrue(MessageCount(testConnection) > 0);
    CloseConnection(testConnection);
end;
procedure TIntegrationTests.TestMessageCountFromNameIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    AssertEquals(MessageCount("test_server"), 1);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestMessageDataIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals(MessageData(testMessage), "Test Message");
    CloseMessage(testMessage);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestMessageDataBytesIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Hello, World!", testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    testMessageBytes := MessageDataBytes(testMessage);
    AssertEquals(MessageData(testMessage), "Hello, World!");
    CloseMessage(testMessage);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestMessageHostIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals(MessageHost(testMessage), "127.0.0.1");
    CloseMessage(testMessage);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestMessagePortIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals(MessagePort(testMessage), 5000);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestMessageProtocolIntegration;
begin
    testServer := CreateServer("test_server", 5000, ConnectionType.UDP);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000, ConnectionType.UDP);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals(MessageProtocol(testMessage), ConnectionType.UDP);
    CloseMessage(testMessage);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestMyIPIntegration;
begin
    testIP := MyIP();
    AssertEquals(testIP, "127.0.0.1");
end;
procedure TIntegrationTests.TestNameForConnectionIntegration;
begin
    testConnectionName := NameForConnection("localhost", 8080);
    AssertEquals(testConnectionName, "localhost:8080");
end;
procedure TIntegrationTests.TestNewConnectionCountIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    AssertTrue(NewConnectionCount(testServer) > 0);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestOpenConnectionIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 8080);
    AssertNotNull(testConnection);
    connectionStatus := IsConnectionOpen(testConnection);
    AssertTrue(connectionStatus);
    CloseConnection(testConnection);
    connectionStatus := IsConnectionOpen(testConnection);
    AssertFalse(connectionStatus);
end;
procedure TIntegrationTests.TestOpenConnectionWithProtocolIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000, ConnectionType.TCP);
    AssertNotNull(testConnection);
    CloseConnection(testConnection);
end;
procedure TIntegrationTests.TestReadMessageIntegration;
begin
    testMessage := ReadMessage();
    AssertNotNull(testMessage);
    CloseMessage(testMessage);
end;
procedure TIntegrationTests.TestReadMessageFromConnectionIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testConnection);
    AssertEquals(MessageData(testMessage), "Test Message");
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestReadMessageFromNameIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", "test_server");
    CheckNetworkActivity();
    testMessage := ReadMessage("test_server");
    AssertEquals(MessageData(testMessage), "Test Message");
    CloseMessage(testMessage);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestReadMessageFromServerIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals(MessageData(testMessage), "Test Message");
    CloseConnection(testConnection);
    CloseServer(testServer);
    CloseMessage(testMessage);
end;
procedure TIntegrationTests.TestReadMessageDataFromNameIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    testMessageData := ReadMessageData("test_server");
    AssertEquals(testMessageData, "Test Message");
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestReadMessageDataFromConnectionIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    ProcessEvents();
    testMessageData := ReadMessageData(testConnection);
    AssertEquals(testMessageData, "Test Message");
    CloseConnection(testConnection);
end;
procedure TIntegrationTests.TestReadMessageDataFromServerIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    SendMessageTo("Test Message", testConnection);
    CheckNetworkActivity();
    testMessageData := ReadMessageData(testServer);
    AssertEquals(testMessageData, "Test Message");
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestReconnectIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CloseConnection(testConnection);
    Reconnect(testConnection);
    AssertTrue(IsConnectionOpen(testConnection));
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestReconnectFromNameIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CloseConnection(testConnection);
    Reconnect("test_connection");
    AssertTrue(IsConnectionOpen("test_connection"));
    CloseServer(testServer);
    CloseConnection(testConnection);
end;
procedure TIntegrationTests.TestReleaseAllConnectionsIntegration;
begin
    testConnection := OpenConnection("test_connection", "127.0.0.1", 8080);
    connectionExists := HasConnection("test_connection");
    AssertTrue(connectionExists);
    ReleaseAllConnections();
    connectionExistsAfterRelease := HasConnection("test_connection");
    AssertFalse(connectionExistsAfterRelease);
end;
procedure TIntegrationTests.TestResetNewConnectionCountIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    AssertTrue(NewConnectionCount(testServer) > 0);
    ResetNewConnectionCount(testServer);
    AssertEquals(NewConnectionCount(testServer), 0);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestRetrieveConnectionNamedIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    retrievedConnection := RetrieveConnection("test_server", 0);
    AssertNotNull(retrievedConnection);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestRetrieveConnectionIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    retrievedConnection := RetrieveConnection(testServer, 0);
    AssertNotNull(retrievedConnection);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestSendMessageToConnectionIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    sendResult := SendMessageTo("Test Message", testConnection);
    AssertTrue(sendResult);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestSendMessageToNameIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    testConnection := OpenConnection("test_connection", "127.0.0.1", 5000);
    sendResult := SendMessageTo("Hello, Server!", "test_connection");
    AssertTrue(sendResult);
    CloseConnection(testConnection);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestServerHasNewConnectionNamedIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    AssertTrue(ServerHasNewConnection("test_server"));
    CloseServer(testServer);
    CloseAllConnections();
end;
procedure TIntegrationTests.TestServerHasNewConnectionIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    OpenConnection("test_connection", "127.0.0.1", 5000);
    CheckNetworkActivity();
    AssertTrue(ServerHasNewConnection(testServer));
    CloseServer(testServer);
    CloseAllConnections();
end;
procedure TIntegrationTests.TestServerNamedIntegration;
begin
    testServer := CreateServer("test_server", 5000);
    retrievedServer := ServerNamed("test_server");
    AssertNotNull(retrievedServer);
    CloseServer(testServer);
end;
procedure TIntegrationTests.TestSetUDPPacketSizeIntegration;
begin
    SetUDPPacketSize(1024);
    AssertEquals(UDPPacketSize(), 1024);
end;
procedure TIntegrationTests.TestUDPPacketSizeIntegration;
begin
    testPacketSize := UDPPacketSize();
    AssertTrue(testPacketSize > 0);
end;
procedure TIntegrationTests.TestDownloadBitmapIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := DownloadBitmap("test_image", "http://example.com/test_image.png", 80);
    DrawBitmap(testBitmap, 0, 0);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50, 50));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDownloadFontIntegration;
begin
    testFont := DownloadFont("test_font", "http://example.com/font.ttf", 80);
    AssertNotNull(testFont);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestDownloadMusicIntegration;
begin
    testMusic := DownloadMusic("test_music", "http://example.com/music.mp3", 80);
    AssertNotNull(testMusic);
    FreeMusic(testMusic);
end;
procedure TIntegrationTests.TestDownloadSoundEffectIntegration;
begin
    testSoundEffect := DownloadSoundEffect("test_sound", "http://example.com/test_sound.wav", 80);
    AssertNotNull(testSoundEffect);
    FreeSoundEffect(testSoundEffect);
end;
procedure TIntegrationTests.TestFreeResponseIntegration;
begin
    testResponse := HttpGet("http://example.com", 80);
    FreeResponse(testResponse);
    AssertNull(HttpResponseToString(testResponse));
end;
procedure TIntegrationTests.TestHttpGetIntegration;
begin
    testResponse := HttpGet("http://example.com", 80);
    AssertNotNull(testResponse);
    testResponseText := HttpResponseToString(testResponse);
    AssertNotEquals(testResponseText, "");
    FreeResponse(testResponse);
end;
procedure TIntegrationTests.TestHttpPostWithHeadersIntegration;
begin
    testResponse := HttpPost("http://httpbin.org/post", 80, "Test Body", ["Content-Type: application/json", "Accept: application/json"]);
    AssertNotNull(testResponse);
    testResponseString := HttpResponseToString(testResponse);
    AssertEquals(stringContains, testResponseString);
    FreeResponse(testResponse);
end;
procedure TIntegrationTests.TestHttpPostIntegration;
begin
    testResponse := HttpPost("http://example.com", 80, "test=123");
    AssertNotNull(testResponse);
    testResponseString := HttpResponseToString(testResponse);
    AssertNotEquals(testResponseString, "");
    FreeResponse(testResponse);
end;
procedure TIntegrationTests.TestHttpResponseToStringIntegration;
begin
    testResponse := HttpGet("http://example.com", 80);
    testString := HttpResponseToString(testResponse);
    AssertNotEquals(testString, "");
    FreeResponse(testResponse);
end;
procedure TIntegrationTests.TestSaveResponseToFileIntegration;
begin
    testResponse := HttpGet("http://example.com", 80);
    SaveResponseToFile(testResponse, "test_output.txt");
    FreeResponse(testResponse);
    AssertEquals(fileExists, "test_output.txt");
    DeleteFile("test_output.txt");
end;
procedure TIntegrationTests.TestHasIncomingRequestsIntegration;
begin
    testServer := StartWebServer(8080);
    hasRequests := HasIncomingRequests(testServer);
    AssertFalse(hasRequests);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestIsDeleteRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    AssertFalse(IsDeleteRequestFor(testRequest, "/test_path"));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestIsGetRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    AssertTrue(IsGetRequestFor(testRequest, "/test"));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestIsOptionsRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    testURI := RequestURI(testRequest);
    testResult := IsOptionsRequestFor(testRequest, testURI);
    AssertTrue(testResult);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestIsPostRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    isPost := IsPostRequestFor(testRequest, "/test_path");
    AssertTrue(isPost);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestIsPutRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    testURI := RequestURI(testRequest);
    testResult := IsPutRequestFor(testRequest, testURI);
    AssertTrue(testResult);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestIsRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    AssertTrue(IsRequestFor(testRequest, HttpMethod.GET, "/test"));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestIsTraceRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    AssertTrue(IsTraceRequestFor(testRequest, "/trace"));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestNextWebRequestIntegration;
begin
    testServer := StartWebServer(8080);
    hasRequests := HasIncomingRequests(testServer);
    AssertFalse(hasRequests);
    testRequest := NextWebRequest(testServer);
    AssertNull(testRequest);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestRequestBodyIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    testBody := RequestBody(testRequest);
    AssertNotNull(testBody);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestRequestHasQueryParameterIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    testQueryString := RequestQueryString(testRequest);
    AssertTrue(RequestHasQueryParameter(testRequest, "param1"));
    AssertFalse(RequestHasQueryParameter(testRequest, "nonexistent_param"));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestRequestHeadersIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    testHeaders := RequestHeaders(testRequest);
    AssertNotNull(testHeaders);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestRequestMethodIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    AssertNotNull(testRequest);
    testMethod := RequestMethod(testRequest);
    AssertEquals(testMethod, HttpMethod.GET);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestRequestQueryParameterIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    testResult := RequestQueryParameter(testRequest, "test_param", "default_value");
    AssertEquals(testResult, "default_value");
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestRequestQueryStringIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    testQueryString := RequestQueryString(testRequest);
    AssertNotNull(testQueryString);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestRequestURIIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    AssertNotNull(testRequest);
    testURI := RequestURI(testRequest);
    AssertNotEquals(testURI, "");
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestRequestURIStubsIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    testURI := RequestURI(testRequest);
    testStubs := RequestURIStubs(testRequest);
    AssertEquals(SplitURIStubs(testURI), testStubs);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendCSSFileResponseIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    SendCSSFileResponse(testRequest, "test.css");
    AssertTrue(HasIncomingRequests(testServer));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendFileResponseIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    SendFileResponse(testRequest, "testfile.txt", "text/plain");
    AssertTrue(HasIncomingRequests(testServer));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendHtmlFileResponseIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    SendHtmlFileResponse(testRequest, "test.html");
    AssertTrue(IsRequestFor(testRequest, HttpMethod.GET, "/test.html"));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendJavascriptFileResponseIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    SendJavascriptFileResponse(testRequest, "test_script.js");
    AssertTrue(HasIncomingRequests(testServer));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendResponseEmptyIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendResponseIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest, "Test Message");
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendResponseJsonWithStatusIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest, HttpStatusCode.OK);
    AssertTrue(HasIncomingRequests(testServer));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendResponseWithStatusIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest, HttpStatusCode.OK, "Test Message");
    AssertTrue(HasIncomingRequests(testServer));
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendResponseWithStatusAndContentTypeIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest, HttpStatusCode.OK, "Test Message", "text/plain");
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendResponseWithStatusAndContentTypeAndHeadersIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest, HttpStatusCode.OK, "Test Message", "text/plain", ["Header1: Value1", "Header2: Value2"]);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSendResponseJsonIntegration;
begin
    testServer := StartWebServer(8080);
    testRequest := NextWebRequest(testServer);
    testJson := CreateJson();
    JsonSetString(testJson, "message", "Hello, World!");
    SendResponse(testRequest, testJson);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestSplitURIStubsIntegration;
begin
    testStubs := SplitURIStubs("/names/0");
    AssertEquals(testStubs, ["names", "0"]);
    testStubsEmpty := SplitURIStubs("/");
    AssertEquals(testStubsEmpty, []);
end;
procedure TIntegrationTests.TestStartWebServerWithDefaultPortIntegration;
begin
    testServer := StartWebServer();
    AssertNotNull(testServer);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestStartWebServerIntegration;
begin
    testServer := StartWebServer(8080);
    AssertNotNull(testServer);
    StopWebServer(testServer);
end;
procedure TIntegrationTests.TestStopWebServerIntegration;
begin
    testServer := StartWebServer(8080);
    AssertTrue(HasIncomingRequests(testServer));
    StopWebServer(testServer);
    AssertFalse(HasIncomingRequests(testServer));
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
