import pytest
from splashkit import *


def test_AcceptAllNewConnections_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    connections_accepted = accept_all_new_connections()
    assert connections_accepted is True
    close_connection(test_connection)
    close_server(test_server)


def test_AcceptNewConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    connection_accepted = accept_new_connection(test_server)
    assert connection_accepted is True
    close_connection(test_connection)
    close_server(test_server)


def test_BroadcastMessage_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection1 = open_connection("test_connection1", "127.0.0.1", 5000)
    test_connection2 = open_connection("test_connection2", "127.0.0.1", 5000)
    check_network_activity()
    broadcast_message("Test Message", test_server)
    check_network_activity()
    assert has_messages(test_connection1) is True
    assert has_messages(test_connection2) is True
    close_all_connections()
    close_server(test_server)


def test_BroadcastMessageToAll_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection1 = open_connection("test_connection", "127.0.0.1", 5000)
    test_connection2 = open_connection("test_connection2", "127.0.0.1", 5000)
    check_network_activity()
    broadcast_message("Test Message")
    check_network_activity()
    assert has_messages(test_connection1) is True
    assert has_messages(test_connection2) is True
    close_all_connections()
    close_server(test_server)


def test_BroadcastMessageToServerNamed_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    broadcast_message("Test Message", "test_server")
    check_network_activity()
    assert has_messages(test_connection) is True
    close_connection(test_connection)
    close_server(test_server)


def test_CheckNetworkActivity_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert has_new_connections() is True
    close_connection(test_connection)
    close_server(test_server)


def test_ClearMessagesFromName_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert has_messages(test_connection) is True
    clear_messages_from_name("test_connection")
    check_network_activity()
    assert has_messages(test_connection) is False
    close_connection(test_connection)
    close_server(test_server)


def test_ClearMessagesFromConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert has_messages(test_connection) is True
    clear_messages_from_connection(test_connection)
    assert has_messages(test_connection) is False
    close_connection(test_connection)
    close_server(test_server)


def test_ClearMessagesFromServer_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 8080)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert has_messages(test_server) is True
    clear_messages_from_connection(test_server)
    check_network_activity()
    assert has_messages(test_server) is False
    close_server(test_server)


def test_CloseAllConnections_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert has_connection("test_connection") is True
    close_all_connections()
    check_network_activity()
    assert has_connection("test_connection") is False
    close_server(test_server)


def test_CloseAllServers_integration():
    test_server1 = create_server_with_port("test_server_1", 5000)
    test_server2 = create_server_with_port("test_server_2", 5001)
    assert has_server("test_server_1") is True
    assert has_server("test_server_2") is True
    close_all_servers()
    assert has_server("test_server_1") is False
    assert has_server("test_server_2") is False


def test_CloseConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 8080)
    check_network_activity()
    close_result = close_connection(test_connection)
    assert close_result is True
    assert is_connection_open(test_connection) is False
    close_server(test_server)


def test_CloseConnectionNamed_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 8080)
    check_network_activity()
    assert is_connection_open(test_connection) is True
    close_result = close_connection("test_connection")
    assert close_result is True
    assert is_connection_open(test_connection) is False
    close_server(test_server)


def test_CloseMessage_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert has_messages() is True
    test_message = read_message()
    assert test_message is not None
    close_message(test_message)
    assert has_messages() is False
    close_connection(test_connection)
    close_server(test_server)


def test_CloseServerNamed_integration():
    test_server = create_server_with_port("test_server", 5000)
    close_result = close_server("test_server")
    assert close_result is True
    assert has_server("test_server") is False


def test_CloseServer_integration():
    test_server = create_server_with_port("test_server", 5000)
    close_result = close_server(test_server)
    assert close_result is True
    assert has_server("test_server") is False


def test_ConnectionCountNamed_integration():
    test_server = create_server_with_port("test_server", 5000)
    open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert 1 == connection_count("test_server")
    close_all_connections()
    close_server(test_server)


def test_ConnectionCount_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert 1 == connection_count(test_server)
    close_connection(test_connection)
    close_server(test_server)


def test_ConnectionIP_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    test_ip = connection_ip(test_connection)
    assert 2130706433 == test_ip
    close_connection(test_connection)
    close_server(test_server)


def test_ConnectionIPFromName_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_connection = open_connection("test_connection", "127.0.0.1", 8080)
    check_network_activity()
    test_ip = connection_ip("test_connection")
    assert 2130706433 == test_ip
    close_connection(test_connection)
    close_server(test_server)


def test_ConnectionNamed_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    retrieved_connection = connection_named("test_connection")
    assert retrieved_connection is not None
    close_connection(test_connection)
    close_server(test_server)


def test_ConnectionPort_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    test_port = connection_port(test_connection)
    assert 5000 == test_port
    close_connection(test_connection)
    close_server(test_server)


def test_ConnectionPortFromName_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    test_port = connection_port("test_connection")
    assert 5000 == test_port
    close_connection(test_connection)
    close_server(test_server)


def test_CreateServerWithPort_integration():
    test_server = create_server_with_port("test_server", 5000)
    assert test_server is not None
    assert has_server("test_server") is True
    close_server(test_server)


def test_CreateServerWithPortAndProtocol_integration():
    test_server = create_server_with_port("test_server", 5000, ConnectionType.TCP)
    assert test_server is not None
    assert has_server("test_server") is True
    close_server(test_server)


def test_DecToHex_integration():
    test_hex_result = dec_to_hex(2130706433)
    assert "0x7F000001" == test_hex_result


def test_FetchNewConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    new_connection = fetch_new_connection(test_server)
    assert new_connection is not None
    close_connection(new_connection)
    close_server(test_server)


def test_HasConnection_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_connection = open_connection("test_connection", "127.0.0.1", 8080)
    check_network_activity()
    assert has_connection("test_connection") is True
    close_connection(test_connection)
    assert has_connection("test_connection") is False
    close_server(test_server)


def test_HasMessages_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert has_messages() is False
    send_message_to_connection("test_message", test_connection)
    check_network_activity()
    assert has_messages() is True
    close_connection(test_connection)
    close_server(test_server)


def test_HasMessagesOnConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert has_messages(test_connection) is True
    close_connection(test_connection)
    close_server(test_server)


def test_HasMessagesOnName_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert has_messages("test_server") is True
    close_connection(test_connection)
    close_server(test_server)


def test_HasMessagesOnServer_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert has_messages(test_server) is True
    close_connection(test_connection)
    close_server(test_server)


def test_HasNewConnections_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert has_new_connections() is True
    close_connection(test_connection)
    close_server(test_server)


def test_HasServer_integration():
    test_server = create_server_with_port("test_server", 5000)
    assert has_server("test_server") is True
    close_server(test_server)
    assert has_server("test_server") is False


def test_HexStrToIpv4_integration():
    test_ipv4 = hex_str_to_ipv4("0x7F000001")
    assert "127.0.0.1" == test_ipv4
    test_ipv4_no_prefix = hex_str_to_ipv4("7F000001")
    assert "127.0.0.1" == test_ipv4_no_prefix


def test_HexToDecString_integration():
    test_result = hex_to_dec_string("7F")
    assert "127" == test_result
    test_result_with_prefix = hex_to_dec_string("0x7F")
    assert "127" == test_result_with_prefix


def test_Ipv4ToDec_integration():
    test_result1 = ipv4_to_dec("127.0.0.1")
    assert 2130706433 == test_result1
    test_result2 = ipv4_to_dec("192.168.1.1")
    assert 3232235777 == test_result2


def test_Ipv4ToHex_integration():
    test_ipv4_hex = ipv4_to_hex("127.0.0.1")
    assert "0x7F000001" == test_ipv4_hex


def test_Ipv4ToStr_integration():
    test_ip_str = ipv4_to_str(2130706433)
    assert "127.0.0.1" == test_ip_str


def test_IsConnectionOpen_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert is_connection_open(test_connection) is True
    close_connection(test_connection)
    assert is_connection_open(test_connection) is False
    close_server(test_server)


def test_IsConnectionOpenFromName_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert is_connection_open("test_connection") is True
    close_connection(test_connection)
    assert is_connection_open("test_connection") is False
    close_server(test_server)


def test_LastConnectionNamed_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    last_connection = last_connection("test_server")
    assert test_connection == last_connection
    close_connection(test_connection)
    close_server(test_server)


def test_LastConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    last_connection = last_connection(test_server)
    assert test_connection == last_connection
    close_connection(test_connection)
    close_server(test_server)


def test_MessageConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    test_message = read_message(test_server)
    assert test_connection == message_connection(test_message)
    close_message(test_message)
    close_connection(test_connection)
    close_server(test_server)


def test_MessageCountOnServer_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert 1 == message_count_on_server(test_server)
    close_connection(test_connection)
    close_server(test_server)


def test_MessageCountOnConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert message_count_on_connection(test_connection) is True
    close_connection(test_connection)
    close_server(test_server)


def test_MessageCountFromName_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert 1 == message_count_on_server("test_server")
    close_connection(test_connection)
    close_server(test_server)


def test_MessageData_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    test_message = read_message(test_server)
    assert "Test Message" == message_data(test_message)
    close_message(test_message)
    close_connection(test_connection)
    close_server(test_server)


def test_MessageDataBytes_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    test_message = read_message(test_server)
    test_message_bytes = message_data_bytes(test_message)
    assert test_message_bytes is not None
    close_message(test_message)
    close_connection(test_connection)
    close_server(test_server)


def test_MessageHost_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    test_message = read_message(test_server)
    assert "127.0.0.1" == message_host(test_message)
    close_message(test_message)
    close_connection(test_connection)
    close_server(test_server)


def test_MessagePort_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    test_message = read_message(test_server)
    assert 5000 == message_port(test_message)
    close_message(test_message)
    close_connection(test_connection)
    close_server(test_server)


def test_MessageProtocol_integration():
    test_server = create_server_with_port("test_server", 5000, ConnectionType.UDP)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000, ConnectionType.UDP)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    test_message = read_message(test_server)
    assert ConnectionType.UDP == message_protocol(test_message)
    close_message(test_message)
    close_connection(test_connection)
    close_server(test_server)


def test_MyIP_integration():
    test_ip = my_ip()
    assert "127.0.0.1" == test_ip


def test_NameForConnection_integration():
    test_connection_name = name_for_connection("localhost", 8080)
    assert "localhost:8080" == test_connection_name


def test_NewConnectionCount_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert 1 == new_connection_count(test_server)
    close_connection(test_connection)
    close_server(test_server)


def test_OpenConnection_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_connection = open_connection("test_connection", "127.0.0.1", 8080)
    check_network_activity()
    assert test_connection is not None
    assert is_connection_open(test_connection) is True
    close_connection(test_connection)
    assert is_connection_open(test_connection) is False
    close_server(test_server)


def test_OpenConnectionWithProtocol_integration():
    test_server = create_server_with_port("test_server", 5000, ConnectionType.TCP)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000, ConnectionType.TCP)
    check_network_activity()
    assert test_connection is not None
    close_connection(test_connection)
    close_server(test_server)


def test_ReadMessage_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    test_message = read_message()
    assert "Test Message" == message_data(test_message)
    close_message(test_message)
    close_connection(test_connection)
    close_server(test_server)


def test_ReadMessageFromConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    test_message = read_message(test_connection)
    assert "Test Message" == message_data(test_message)
    close_message(test_message)
    close_connection(test_connection)
    close_server(test_server)


def test_ReadMessageFromName_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    test_message = read_message("test_server")
    assert "Test Message" == message_data(test_message)
    close_message(test_message)
    close_connection(test_connection)
    close_server(test_server)


def test_ReadMessageFromServer_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    test_message = read_message(test_server)
    assert "Test Message" == message_data(test_message)
    close_connection(test_connection)
    close_server(test_server)
    close_message(test_message)


def test_ReadMessageDataFromName_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert "Test Message" == read_message_data_from_name("test_server")
    close_connection(test_connection)
    close_server(test_server)


def test_ReadMessageDataFromConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert "Test Message" == read_message_data_from_connection(test_connection)
    close_connection(test_connection)
    close_server(test_server)


def test_ReadMessageDataFromServer_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert "Test Message" == read_message_data_from_server(test_server)
    close_connection(test_connection)
    close_server(test_server)


def test_Reconnect_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    close_connection(test_connection)
    check_network_activity()
    assert is_connection_open(test_connection) is False
    reconnect(test_connection)
    check_network_activity()
    assert is_connection_open(test_connection) is True
    close_connection(test_connection)
    close_server(test_server)


def test_ReconnectFromName_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    close_connection(test_connection)
    check_network_activity()
    assert is_connection_open(test_connection) is False
    reconnect("test_connection")
    check_network_activity()
    assert is_connection_open("test_connection") is True
    close_connection(test_connection)
    close_server(test_server)


def test_ReleaseAllConnections_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_connection1 = open_connection("test_connection1", "127.0.0.1", 8080)
    test_connection2 = open_connection("test_connection2", "127.0.0.1", 8080)
    check_network_activity()
    assert has_connection("test_connection1") is True
    assert has_connection("test_connection2") is True
    release_all_connections()
    assert has_connection("test_connection1") is False
    assert has_connection("test_connection2") is False
    assert has_server("test_server") is False


def test_ResetNewConnectionCount_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert new_connection_count(test_server) == 1
    reset_new_connection_count(test_server)
    assert 0 == new_connection_count(test_server)
    close_connection(test_connection)
    close_server(test_server)


def test_RetrieveConnectionNamed_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    retrieved_connection = retrieve_connection("test_connection", 0)
    assert test_connection == retrieved_connection
    close_connection(test_connection)
    close_server(test_server)


def test_RetrieveConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    retrieved_connection = retrieve_connection(test_server, 0)
    assert test_connection == retrieved_connection
    close_connection(test_connection)
    close_server(test_server)


def test_SendMessageToConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_result = send_message_to_connection("Test Message", test_connection)
    check_network_activity()
    assert send_result is True
    close_connection(test_connection)
    close_server(test_server)


def test_SendMessageToName_integration():
    test_server = create_server_with_port("test_server", 5000)
    test_connection = open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    send_result = send_message_to_name("Test Message", "test_connection")
    check_network_activity()
    assert send_result is True
    close_connection(test_connection)
    close_server(test_server)


def test_ServerHasNewConnectionNamed_integration():
    test_server = create_server_with_port("test_server", 5000)
    open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert server_has_new_connection("test_server") is True
    close_server(test_server)
    close_all_connections()


def test_ServerHasNewConnection_integration():
    test_server = create_server_with_port("test_server", 5000)
    open_connection("test_connection", "127.0.0.1", 5000)
    check_network_activity()
    assert server_has_new_connection(test_server) is True
    close_server(test_server)
    close_all_connections()


def test_ServerNamed_integration():
    test_server = create_server_with_port("test_server", 5000)
    retrieved_server = server_named("test_server")
    assert test_server == retrieved_server
    close_server(test_server)


def test_SetUDPPacketSize_integration():
    set_udp_packet_size(1024)
    assert 1024 == udp_packet_size()


def test_UDPPacketSize_integration():
    test_packet_size = udp_packet_size()
    assert test_packet_size > 0


def test_DownloadBitmap_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = download_bitmap("test_image", "http://localhost:8080/test/resources/images/frog.png", 80)
    assert test_bitmap is not None
    free_bitmap(test_bitmap)
    close_window(test_window)
    close_server(test_server)


def test_DownloadFont_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_font = download_font("test_font", "http://localhost:8080/test/resources/fonts/hara.ttf", 80)
    assert test_font is not None
    free_font(test_font)
    close_server(test_server)


def test_DownloadMusic_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_music = download_music("test_music", "http://localhost:8080/test/resources/music/280.mp3", 80)
    assert test_music is not None
    free_music(test_music)
    close_server(test_server)


def test_DownloadSoundEffect_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_sound_effect = download_sound_effect("test_sound", "http://localhost:8080/test/resources/sounds/breakdance.wav", 80)
    assert test_sound_effect is not None
    free_sound_effect(test_sound_effect)
    close_server(test_server)


def test_FreeResponse_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_response = http_get("http://localhost:8080/test", 80)
    assert test_response is not None
    free_response(test_response)
    assert "IntPtr.Zero" == test_response
    close_server(test_server)


def test_HttpGet_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_response = http_get("http://localhost:8080/test", 80)
    assert test_response is not None
    response_text = http_response_to_string(test_response)
    assert len(response_text) > 0
    free_response(test_response)
    close_server(test_server)


def test_HttpPostWithHeaders_integration():
    test_server = create_server_with_port("test_server", 8080)
    headers = ["Content-Type: application/json", "Accept: application/json"];
    test_response = http_post("http://localhost:8080/test", 80, "Test Body", headers)
    assert test_response is not None
    response_text = http_response_to_string(test_response)
    assert "Test Body" in response_text
    free_response(test_response)
    close_server(test_server)


def test_HttpPost_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_response = http_post("http://localhost:8080/test", 80, "Test Body")
    assert test_response is not None
    response_text = http_response_to_string(test_response)
    assert "Test Body" in response_text
    free_response(test_response)
    close_server(test_server)


def test_HttpResponseToString_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_response = http_get("http://localhost:8080/test", 80)
    response_text = http_response_to_string(test_response)
    assert len(response_text) > 0
    free_response(test_response)
    close_server(test_server)


def test_SaveResponseToFile_integration():
    test_server = create_server_with_port("test_server", 8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_file = "test_output.txt"
    save_response_to_file(test_response, test_file)
    free_response(test_response)
    assert file_exists(test_file) is True
    delete_file(test_file)
    close_server(test_server)


def test_HasIncomingRequests_integration():
    test_server = start_web_server(8080)
    assert has_incoming_requests(test_server) is False
    test_response = http_get("http://localhost:8080/test", 80)
    assert has_incoming_requests(test_server) is True
    free_response(test_response)
    stop_web_server(test_server)


def test_IsDeleteRequestFor_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    assert has_incoming_requests(test_server) is True
    test_request = next_web_request(test_server)
    assert is_delete_request_for(test_request, "/test") is False
    free_response(test_response)
    stop_web_server(test_server)


def test_IsGetRequestFor_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    assert has_incoming_requests(test_server) is True
    test_request = next_web_request(test_server)
    assert is_get_request_for(test_request, "/test") is True
    free_response(test_response)
    stop_web_server(test_server)


def test_IsOptionsRequestFor_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    assert has_incoming_requests(test_server) is True
    test_request = next_web_request(test_server)
    assert is_options_request_for(test_request, "/test") is False
    free_response(test_response)
    stop_web_server(test_server)


def test_IsPostRequestFor_integration():
    test_server = start_web_server(8080)
    test_response = http_post("http://localhost:8080/test_path", 80, "test=123")
    assert has_incoming_requests(test_server) is True
    test_request = next_web_request(test_server)
    assert is_post_request_for(test_request, "/test_path") is True
    free_response(test_response)
    stop_web_server(test_server)


def test_IsPutRequestFor_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    assert has_incoming_requests(test_server) is True
    test_request = next_web_request(test_server)
    assert is_put_request_for(test_request, "/test") is False
    free_response(test_response)
    stop_web_server(test_server)


def test_IsRequestFor_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    assert has_incoming_requests(test_server) is True
    test_request = next_web_request(test_server)
    assert is_request_for(test_request, HttpMethod.HttpGetMethod, "/test") is True
    free_response(test_response)
    stop_web_server(test_server)


def test_IsTraceRequestFor_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    assert has_incoming_requests(test_server) is True
    test_request = next_web_request(test_server)
    assert is_trace_request_for(test_request, "/test") is False
    free_response(test_response)
    stop_web_server(test_server)


def test_NextWebRequest_integration():
    test_server = start_web_server(8080)
    assert has_incoming_requests(test_server) is False
    test_request = next_web_request(test_server)
    assert test_request is None
    stop_web_server(test_server)


def test_RequestBody_integration():
    test_server = start_web_server(8080)
    test_response = http_post("http://localhost:8080/test", 80, "test body")
    test_request = next_web_request(test_server)
    assert "test body" == request_body(test_request)
    free_response(test_response)
    stop_web_server(test_server)


def test_RequestHasQueryParameter_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test?param1=value1", 80)
    test_request = next_web_request(test_server)
    assert request_has_query_parameter(test_request, "param1") is True
    assert request_has_query_parameter(test_request, "nonexistent_param") is False
    free_response(test_response)
    stop_web_server(test_server)


def test_RequestHeaders_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_request = next_web_request(test_server)
    assert len(request_headers(test_request)) > 0
    free_response(test_response)
    stop_web_server(test_server)


def test_RequestMethod_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_request = next_web_request(test_server)
    assert HttpMethod.HttpGetMethod == request_method(test_request)
    free_response(test_response)
    stop_web_server(test_server)


def test_RequestQueryParameter_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test?param1=value1", 80)
    test_request = next_web_request(test_server)
    test_result = request_query_parameter(test_request, "param1", "default_value")
    assert "value1" == test_result
    free_response(test_response)
    stop_web_server(test_server)


def test_RequestQueryString_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test?param1=value1", 80)
    test_request = next_web_request(test_server)
    test_query_string = request_query_string(test_request)
    assert "param1=value1" == test_query_string
    free_response(test_response)
    stop_web_server(test_server)


def test_RequestURI_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_request = next_web_request(test_server)
    test_uri = request_uri(test_request)
    assert "/test" == test_uri
    free_response(test_response)
    stop_web_server(test_server)


def test_RequestURIStubs_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test/path", 80)
    test_request = next_web_request(test_server)
    test_stubs = request_uri_stubs(test_request)
    assert ["test", "path"]; == test_stubs
    free_response(test_response)
    stop_web_server(test_server)


def test_SendCSSFileResponse_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test.css", 80)
    test_request = next_web_request(test_server)
    send_css_file_response(test_request, "test.css")
    assert is_request_for(test_request, HttpMethod.HttpGetMethod, "/test.css") is True
    free_response(test_response)
    stop_web_server(test_server)


def test_SendFileResponse_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test.txt", 80)
    test_request = next_web_request(test_server)
    send_file_response(test_request, "test.txt", "text/plain")
    assert is_request_for(test_request, HttpMethod.HttpGetMethod, "/test.txt") is True
    free_response(test_response)
    stop_web_server(test_server)


def test_SendHtmlFileResponse_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test.html", 80)
    test_request = next_web_request(test_server)
    send_html_file_response(test_request, "test.html")
    assert is_request_for(test_request, HttpMethod.HttpGetMethod, "/test.html") is True
    free_response(test_response)
    stop_web_server(test_server)


def test_SendJavascriptFileResponse_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test.js", 80)
    test_request = next_web_request(test_server)
    send_javascript_file_response(test_request, "test.js")
    assert is_request_for(test_request, HttpMethod.HttpGetMethod, "/test.js") is True
    free_response(test_response)
    stop_web_server(test_server)


def test_SendResponseEmpty_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_request = next_web_request(test_server)
    send_response(test_request)
    free_response(test_response)
    stop_web_server(test_server)


def test_SendResponse_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_request = next_web_request(test_server)
    send_response(test_request, "Test Message")
    free_response(test_response)
    stop_web_server(test_server)


def test_SendResponseJsonWithStatus_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_request = next_web_request(test_server)
    send_response(test_request, HttpStatusCode.HttpStatusOk)
    free_response(test_response)
    stop_web_server(test_server)


def test_SendResponseWithStatus_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_request = next_web_request(test_server)
    send_response(test_request, HttpStatusCode.HttpStatusOk, "Test Message")
    free_response(test_response)
    stop_web_server(test_server)


def test_SendResponseWithStatusAndContentType_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_request = next_web_request(test_server)
    send_response(test_request, HttpStatusCode.HttpStatusOk, "Test Message", "text/plain")
    free_response(test_response)
    stop_web_server(test_server)


def test_SendResponseWithStatusAndContentTypeAndHeaders_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_request = next_web_request(test_server)
    send_response(test_request, HttpStatusCode.HttpStatusOk, "Test Message", "text/plain", ["Header1: Value1", "Header2: Value2"];)
    free_response(test_response)
    stop_web_server(test_server)


def test_SendResponseJson_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    test_request = next_web_request(test_server)
    test_json = create_json()
    json_set_string(test_json, "message", "Test Message")
    send_response(test_request, test_json)
    free_response(test_response)
    free_json(test_json)
    stop_web_server(test_server)


def test_SplitURIStubs_integration():
    test_stubs = split_uri_stubs("/names/0")
    assert ["names", "0"]; == test_stubs
    test_stubs_empty = split_uri_stubs("/")
    assert len(test_stubs_empty) == 0


def test_StartWebServerWithDefaultPort_integration():
    test_server = start_web_server()
    assert test_server is not None
    stop_web_server(test_server)


def test_StartWebServer_integration():
    test_server = start_web_server(8080)
    assert "testServer" != {:value_type=>"pointer_zero"}
    stop_web_server(test_server)


def test_StopWebServer_integration():
    test_server = start_web_server(8080)
    test_response = http_get("http://localhost:8080/test", 80)
    assert has_incoming_requests(test_server) is True
    free_response(test_response)
    stop_web_server(test_server)

