using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestAcceptAllNewConnectionsIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var connectionsAccepted = AcceptAllNewConnections();
            Assert.True(connectionsAccepted);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestAcceptNewConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var connectionAccepted = AcceptNewConnection(testServer);
            Assert.True(connectionAccepted);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestBroadcastMessageIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection1 = OpenConnection("client1", "127.0.0.1", 5000);
            var testConnection2 = OpenConnection("client2", "127.0.0.1", 5000);
            BroadcastMessage("Test Message", testServer);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection1));
            Assert.True(HasMessages(testConnection2));
            CloseConnection(testConnection1);
            CloseConnection(testConnection2);
            CloseServer(testServer);
        }
        [Fact]
        public void TestBroadcastMessageToAllIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            BroadcastMessage("Test Message");
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestBroadcastMessageToServerNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            BroadcastMessage("Test Message", "test_server");
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestCheckNetworkActivityIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(HasNewConnections());
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestClearMessagesFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            ClearMessages("test_connection");
            CheckNetworkActivity();
            Assert.False(HasMessages(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestClearMessagesFromConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            ClearMessages(testConnection);
            Assert.False(HasMessages(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestClearMessagesFromServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testServer));
            ClearMessages(testServer);
            CheckNetworkActivity();
            Assert.False(HasMessages(testServer));
            CloseServer(testServer);
        }
        [Fact]
        public void TestCloseAllConnectionsIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(HasConnection("test_connection"));
            CloseAllConnections();
            CheckNetworkActivity();
            Assert.False(HasConnection("test_connection"));
            CloseServer(testServer);
        }
        [Fact]
        public void TestCloseAllServersIntegration()
        {
            var testServer1 = CreateServer("test_server_1", 5000);
            var testServer2 = CreateServer("test_server_2", 5001);
            var server1Exists = HasServer("test_server_1");
            var server2Exists = HasServer("test_server_2");
            Assert.True(server1Exists);
            Assert.True(server2Exists);
            CloseAllServers();
            var server1Closed = HasServer("test_server_1");
            var server2Closed = HasServer("test_server_2");
            Assert.False(server1Closed);
            Assert.False(server2Closed);
        }
        [Fact]
        public void TestCloseConnectionIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            var closeResult = CloseConnection(testConnection);
            Assert.True(closeResult);
            var isOpen = IsConnectionOpen(testConnection);
            Assert.False(isOpen);
            CloseAllConnections();
        }
        [Fact]
        public void TestCloseConnectionNamedIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            var testIsOpen = IsConnectionOpen(testConnection);
            Assert.True(testIsOpen);
            var testResult = CloseConnection("test_connection");
            Assert.True(testResult);
            var testIsOpen = IsConnectionOpen(testConnection);
            Assert.False(testIsOpen);
        }
        [Fact]
        public void TestCloseMessageIntegration()
        {
            var testMessage = ReadMessage();
            CloseMessage(testMessage);
            Assert.True(HasMessages());
        }
        [Fact]
        public void TestCloseServerNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var closeResult = CloseServer("test_server");
            Assert.True(closeResult);
            var serverExists = HasServer("test_server");
            Assert.False(serverExists);
        }
        [Fact]
        public void TestCloseServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var closeResult = CloseServer(testServer);
            Assert.True(closeResult);
            var serverExists = HasServer("test_server");
            Assert.False(serverExists);
        }
        [Fact]
        public void TestConnectionCountNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.Equal(1, ConnectionCount("test_server"));
            CloseAllConnections();
            CloseServer(testServer);
        }
        [Fact]
        public void TestConnectionCountIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.Equal(1, ConnectionCount(testServer));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestConnectionIPIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            var testIP = ConnectionIP(testConnection);
            Assert.Equal(2130706433, testIP);
            CloseConnection(testConnection);
        }
        [Fact]
        public void TestConnectionIPFromNameIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            var testIP = ConnectionIP("test_connection");
            Assert.NotEqual(0, testIP);
            CloseConnection(testConnection);
        }
        [Fact]
        public void TestConnectionNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            var retrievedConnection = ConnectionNamed("test_connection");
            Assert.NotNull(retrievedConnection);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestConnectionPortIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            var testPort = ConnectionPort(testConnection);
            Assert.Equal(5000, testPort);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestConnectionPortFromNameIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            var testPort = ConnectionPort("test_connection");
            Assert.Equal(5000, testPort);
            CloseConnection(testConnection);
        }
        [Fact]
        public void TestCreateServerWithPortIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            Assert.NotNull(testServer);
            CloseServer(testServer);
        }
        [Fact]
        public void TestCreateServerWithPortAndProtocolIntegration()
        {
            var testServer = CreateServer("test_server", 5000, ConnectionType.TCP);
            Assert.NotNull(testServer);
            var serverExists = HasServer("test_server");
            Assert.True(serverExists);
            CloseServer(testServer);
        }
        [Fact]
        public void TestDecToHexIntegration()
        {
            var testHexResult = DecToHex(2130706433);
            Assert.Equal("0x7F000001", testHexResult);
        }
        [Fact]
        public void TestFetchNewConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var newConnection = FetchNewConnection(testServer);
            Assert.NotNull(newConnection);
            CloseConnection(newConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasConnectionIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            Assert.True(HasConnection("test_connection"));
            CloseConnection(testConnection);
            Assert.False(HasConnection("test_connection"));
        }
        [Fact]
        public void TestHasMessagesIntegration()
        {
            var testResult = HasMessages();
            Assert.False(testResult);
            SendMessageTo("test_message", OpenConnection("test_connection", "127.0.0.1", 5000));
            var testResult = HasMessages();
            Assert.True(testResult);
            CloseAllConnections();
        }
        [Fact]
        public void TestHasMessagesOnConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasMessagesOnNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages("test_server"));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasMessagesOnServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testServer));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasNewConnectionsIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(HasNewConnections());
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            Assert.True(HasServer("test_server"));
            CloseServer(testServer);
            Assert.False(HasServer("test_server"));
        }
        [Fact]
        public void TestHexStrToIpv4Integration()
        {
            var testIpv4 = HexStrToIpv4("0x7F000001");
            Assert.Equal("127.0.0.1", testIpv4);
            var testIpv4NoPrefix = HexStrToIpv4("7F000001");
            Assert.Equal("127.0.0.1", testIpv4NoPrefix);
        }
        [Fact]
        public void TestHexToDecStringIntegration()
        {
            var testResult = HexToDecString("7F");
            Assert.Equal("127", testResult);
            var testResultWithPrefix = HexToDecString("0x7F");
            Assert.Equal("127", testResultWithPrefix);
        }
        [Fact]
        public void TestIpv4ToDecIntegration()
        {
            var testResult = Ipv4ToDec("127.0.0.1");
            Assert.Equal(2130706433, testResult);
            var testResult = Ipv4ToDec("192.168.1.1");
            Assert.Equal(3232235777, testResult);
        }
        [Fact]
        public void TestIpv4ToHexIntegration()
        {
            var testIpv4Hex = Ipv4ToHex("127.0.0.1");
            Assert.Equal("0x7F000001", testIpv4Hex);
        }
        [Fact]
        public void TestIpv4ToStrIntegration()
        {
            var testIPStr = Ipv4ToStr(2130706433);
            Assert.Equal("127.0.0.1", testIPStr);
        }
        [Fact]
        public void TestIsConnectionOpenIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            Assert.True(IsConnectionOpen(testConnection));
            CloseConnection(testConnection);
            Assert.False(IsConnectionOpen(testConnection));
            CloseServer(testServer);
        }
        [Fact]
        public void TestIsConnectionOpenFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen("test_connection"));
            CloseConnection(testConnection);
            CheckNetworkActivity();
            Assert.False(IsConnectionOpen("test_connection"));
            CloseServer(testServer);
        }
        [Fact]
        public void TestLastConnectionNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var lastConn = LastConnection("test_server");
            Assert.NotNull(lastConn);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestLastConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var lastConn = LastConnection(testServer);
            Assert.Equal(5000, ConnectionPort(lastConn));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal(testConnection, MessageConnection(testMessage));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageCountOnServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            SendMessageTo("Test Message", OpenConnection("test_connection", "127.0.0.1", 5000));
            ProcessEvents();
            Assert.Equal(1, MessageCount(testServer));
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageCountOnConnectionIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            ProcessEvents();
            Assert.True(MessageCount(testConnection) > 0);
            CloseConnection(testConnection);
        }
        [Fact]
        public void TestMessageCountFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal(1, MessageCount("test_server"));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageDataIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageDataBytesIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Hello, World!", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            var testMessageBytes = MessageDataBytes(testMessage);
            Assert.Equal("Hello, World!", MessageData(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageHostIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal("127.0.0.1", MessageHost(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessagePortIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal(5000, MessagePort(testMessage));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageProtocolIntegration()
        {
            var testServer = CreateServer("test_server", 5000, ConnectionType.UDP);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000, ConnectionType.UDP);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal(ConnectionType.UDP, MessageProtocol(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMyIPIntegration()
        {
            var testIP = MyIP();
            Assert.Equal("127.0.0.1", testIP);
        }
        [Fact]
        public void TestNameForConnectionIntegration()
        {
            var testConnectionName = NameForConnection("localhost", 8080);
            Assert.Equal("localhost:8080", testConnectionName);
        }
        [Fact]
        public void TestNewConnectionCountIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(NewConnectionCount(testServer) > 0);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestOpenConnectionIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            Assert.NotNull(testConnection);
            var connectionStatus = IsConnectionOpen(testConnection);
            Assert.True(connectionStatus);
            CloseConnection(testConnection);
            var connectionStatus = IsConnectionOpen(testConnection);
            Assert.False(connectionStatus);
        }
        [Fact]
        public void TestOpenConnectionWithProtocolIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000, ConnectionType.TCP);
            Assert.NotNull(testConnection);
            CloseConnection(testConnection);
        }
        [Fact]
        public void TestReadMessageIntegration()
        {
            var testMessage = ReadMessage();
            Assert.NotNull(testMessage);
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestReadMessageFromConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testConnection);
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReadMessageFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", "test_server");
            CheckNetworkActivity();
            var testMessage = ReadMessage("test_server");
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReadMessageFromServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseConnection(testConnection);
            CloseServer(testServer);
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestReadMessageDataFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessageData = ReadMessageData("test_server");
            Assert.Equal("Test Message", testMessageData);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReadMessageDataFromConnectionIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            ProcessEvents();
            var testMessageData = ReadMessageData(testConnection);
            Assert.Equal("Test Message", testMessageData);
            CloseConnection(testConnection);
        }
        [Fact]
        public void TestReadMessageDataFromServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessageData = ReadMessageData(testServer);
            Assert.Equal("Test Message", testMessageData);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReconnectIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CloseConnection(testConnection);
            Reconnect(testConnection);
            Assert.True(IsConnectionOpen(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReconnectFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CloseConnection(testConnection);
            Reconnect("test_connection");
            Assert.True(IsConnectionOpen("test_connection"));
            CloseServer(testServer);
            CloseConnection(testConnection);
        }
        [Fact]
        public void TestReleaseAllConnectionsIntegration()
        {
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            var connectionExists = HasConnection("test_connection");
            Assert.True(connectionExists);
            ReleaseAllConnections();
            var connectionExistsAfterRelease = HasConnection("test_connection");
            Assert.False(connectionExistsAfterRelease);
        }
        [Fact]
        public void TestResetNewConnectionCountIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(NewConnectionCount(testServer) > 0);
            ResetNewConnectionCount(testServer);
            Assert.Equal(0, NewConnectionCount(testServer));
            CloseServer(testServer);
        }
        [Fact]
        public void TestRetrieveConnectionNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var retrievedConnection = RetrieveConnection("test_server", 0);
            Assert.NotNull(retrievedConnection);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestRetrieveConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var retrievedConnection = RetrieveConnection(testServer, 0);
            Assert.NotNull(retrievedConnection);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestSendMessageToConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            var sendResult = SendMessageTo("Test Message", testConnection);
            Assert.True(sendResult);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestSendMessageToNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            var sendResult = SendMessageTo("Hello, Server!", "test_connection");
            Assert.True(sendResult);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestServerHasNewConnectionNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(ServerHasNewConnection("test_server"));
            CloseServer(testServer);
            CloseAllConnections();
        }
        [Fact]
        public void TestServerHasNewConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(ServerHasNewConnection(testServer));
            CloseServer(testServer);
            CloseAllConnections();
        }
        [Fact]
        public void TestServerNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var retrievedServer = ServerNamed("test_server");
            Assert.NotNull(retrievedServer);
            CloseServer(testServer);
        }
        [Fact]
        public void TestSetUDPPacketSizeIntegration()
        {
            SetUDPPacketSize(1024);
            Assert.Equal(1024, UDPPacketSize());
        }
        [Fact]
        public void TestUDPPacketSizeIntegration()
        {
            var testPacketSize = UDPPacketSize();
            Assert.True(testPacketSize > 0);
        }
        [Fact]
        public void TestDownloadBitmapIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = DownloadBitmap("test_image", "http://example.com/test_image.png", 80);
            DrawBitmap(testBitmap, 0, 0);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, 50, 50));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDownloadFontIntegration()
        {
            var testFont = DownloadFont("test_font", "http://example.com/font.ttf", 80);
            Assert.NotNull(testFont);
            FreeFont(testFont);
        }
        [Fact]
        public void TestDownloadMusicIntegration()
        {
            var testMusic = DownloadMusic("test_music", "http://example.com/music.mp3", 80);
            Assert.NotNull(testMusic);
            FreeMusic(testMusic);
        }
        [Fact]
        public void TestDownloadSoundEffectIntegration()
        {
            var testSoundEffect = DownloadSoundEffect("test_sound", "http://example.com/test_sound.wav", 80);
            Assert.NotNull(testSoundEffect);
            FreeSoundEffect(testSoundEffect);
        }
        [Fact]
        public void TestFreeResponseIntegration()
        {
            var testResponse = HttpGet("http://example.com", 80);
            FreeResponse(testResponse);
            Assert.Null(HttpResponseToString(testResponse));
        }
        [Fact]
        public void TestHttpGetIntegration()
        {
            var testResponse = HttpGet("http://example.com", 80);
            Assert.NotNull(testResponse);
            var testResponseText = HttpResponseToString(testResponse);
            Assert.NotEqual("", testResponseText);
            FreeResponse(testResponse);
        }
        [Fact]
        public void TestHttpPostWithHeadersIntegration()
        {
            var testResponse = HttpPost("http://httpbin.org/post", 80, "Test Body", ["Content-Type: application/json", "Accept: application/json"]);
            Assert.NotNull(testResponse);
            var testResponseString = HttpResponseToString(testResponse);
            Assert.Equal(testResponseString, stringContains);
            FreeResponse(testResponse);
        }
        [Fact]
        public void TestHttpPostIntegration()
        {
            var testResponse = HttpPost("http://example.com", 80, "test=123");
            Assert.NotNull(testResponse);
            var testResponseString = HttpResponseToString(testResponse);
            Assert.NotEqual("", testResponseString);
            FreeResponse(testResponse);
        }
        [Fact]
        public void TestHttpResponseToStringIntegration()
        {
            var testResponse = HttpGet("http://example.com", 80);
            var testString = HttpResponseToString(testResponse);
            Assert.NotEqual("", testString);
            FreeResponse(testResponse);
        }
        [Fact]
        public void TestSaveResponseToFileIntegration()
        {
            var testResponse = HttpGet("http://example.com", 80);
            SaveResponseToFile(testResponse, "test_output.txt");
            FreeResponse(testResponse);
            Assert.Equal("test_output.txt", fileExists);
            DeleteFile("test_output.txt");
        }
        [Fact]
        public void TestHasIncomingRequestsIntegration()
        {
            var testServer = StartWebServer(8080);
            var hasRequests = HasIncomingRequests(testServer);
            Assert.False(hasRequests);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsDeleteRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            Assert.False(IsDeleteRequestFor(testRequest, "/test_path"));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsGetRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            Assert.True(IsGetRequestFor(testRequest, "/test"));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsOptionsRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            var testURI = RequestURI(testRequest);
            var testResult = IsOptionsRequestFor(testRequest, testURI);
            Assert.True(testResult);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsPostRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            var isPost = IsPostRequestFor(testRequest, "/test_path");
            Assert.True(isPost);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsPutRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            var testURI = RequestURI(testRequest);
            var testResult = IsPutRequestFor(testRequest, testURI);
            Assert.True(testResult);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            Assert.True(IsRequestFor(testRequest, HttpMethod.Get, "/test"));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsTraceRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            Assert.True(IsTraceRequestFor(testRequest, "/trace"));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestNextWebRequestIntegration()
        {
            var testServer = StartWebServer(8080);
            var hasRequests = HasIncomingRequests(testServer);
            Assert.False(hasRequests);
            var testRequest = NextWebRequest(testServer);
            Assert.Null(testRequest);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestBodyIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            var testBody = RequestBody(testRequest);
            Assert.NotNull(testBody);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestHasQueryParameterIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            var testQueryString = RequestQueryString(testRequest);
            Assert.True(RequestHasQueryParameter(testRequest, "param1"));
            Assert.False(RequestHasQueryParameter(testRequest, "nonexistent_param"));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestHeadersIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            var testHeaders = RequestHeaders(testRequest);
            Assert.NotNull(testHeaders);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestMethodIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            Assert.NotNull(testRequest);
            var testMethod = RequestMethod(testRequest);
            Assert.Equal(HttpMethod.Get, testMethod);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestQueryParameterIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            var testResult = RequestQueryParameter(testRequest, "test_param", "default_value");
            Assert.Equal("default_value", testResult);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestQueryStringIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            var testQueryString = RequestQueryString(testRequest);
            Assert.NotNull(testQueryString);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestURIIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            Assert.NotNull(testRequest);
            var testURI = RequestURI(testRequest);
            Assert.NotEqual("", testURI);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestURIStubsIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            var testURI = RequestURI(testRequest);
            var testStubs = RequestURIStubs(testRequest);
            Assert.Equal(testStubs, SplitURIStubs(testURI));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendCSSFileResponseIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            SendCSSFileResponse(testRequest, "test.css");
            Assert.True(HasIncomingRequests(testServer));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendFileResponseIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            SendFileResponse(testRequest, "testfile.txt", "text/plain");
            Assert.True(HasIncomingRequests(testServer));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendHtmlFileResponseIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            SendHtmlFileResponse(testRequest, "test.html");
            Assert.True(IsRequestFor(testRequest, HttpMethod.Get, "/test.html"));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendJavascriptFileResponseIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            SendJavascriptFileResponse(testRequest, "test_script.js");
            Assert.True(HasIncomingRequests(testServer));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseEmptyIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, "Test Message");
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseJsonWithStatusIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.Ok);
            Assert.True(HasIncomingRequests(testServer));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseWithStatusIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.Ok, "Test Message");
            Assert.True(HasIncomingRequests(testServer));
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseWithStatusAndContentTypeIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.Ok, "Test Message", "text/plain");
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseWithStatusAndContentTypeAndHeadersIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.Ok, "Test Message", "text/plain", ["Header1: Value1", "Header2: Value2"]);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseJsonIntegration()
        {
            var testServer = StartWebServer(8080);
            var testRequest = NextWebRequest(testServer);
            var testJson = CreateJson();
            JsonSetString(testJson, "message", "Hello, World!");
            SendResponse(testRequest, testJson);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSplitURIStubsIntegration()
        {
            var testStubs = SplitURIStubs("/names/0");
            Assert.Equal(["names", "0"], testStubs);
            var testStubsEmpty = SplitURIStubs("/");
            Assert.Equal([], testStubsEmpty);
        }
        [Fact]
        public void TestStartWebServerWithDefaultPortIntegration()
        {
            var testServer = StartWebServer();
            Assert.NotNull(testServer);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestStartWebServerIntegration()
        {
            var testServer = StartWebServer(8080);
            Assert.NotNull(testServer);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestStopWebServerIntegration()
        {
            var testServer = StartWebServer(8080);
            Assert.True(HasIncomingRequests(testServer));
            StopWebServer(testServer);
            Assert.False(HasIncomingRequests(testServer));
        }
    }
}
