#include "splashkit.h"
#include <catch2/catch.hpp>
#include "../helpers.hpp"
class TestNetworking {
public:
    TEST_CASE("accept_all_new_connections_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto connections_accepted = accept_all_new_connections();
        REQUIRE(connections_accepted);
    }
    TEST_CASE("accept_new_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto connection_accepted = accept_new_connection(test_server);
        REQUIRE(connection_accepted);
    }
    TEST_CASE("broadcast_message_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection1 = open_connection(string("test_connection1"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        auto test_connection2 = open_connection(string("test_connection2"), string("127.0.0.1"), 5000);
        check_network_activity();
        broadcast_message(string("Test Message"), test_server);
        check_network_activity();
        REQUIRE(has_messages(test_connection1));
        REQUIRE(has_messages(test_connection2));
    }
    TEST_CASE("broadcast_message_to_all_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection1 = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        auto test_connection2 = open_connection(string("test_connection2"), string("127.0.0.1"), 5000);
        check_network_activity();
        broadcast_message(string("Test Message"));
        check_network_activity();
        REQUIRE(has_messages(test_connection1));
        REQUIRE(has_messages(test_connection2));
    }
    TEST_CASE("broadcast_message_to_server_named_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        broadcast_message(string("Test Message"), string("test_server"));
        check_network_activity();
        REQUIRE(has_messages(test_connection));
    }
    TEST_CASE("check_network_activity_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(has_new_connections());
    }
    TEST_CASE("clear_messages_from_name_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(has_messages(test_connection));
        clear_messages(string("test_connection"));
        check_network_activity();
        REQUIRE_FALSE(has_messages(test_connection));
    }
    TEST_CASE("clear_messages_from_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(has_messages(test_connection));
        clear_messages(test_connection);
        REQUIRE_FALSE(has_messages(test_connection));
    }
    TEST_CASE("clear_messages_from_server_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 8080);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(has_messages(test_server));
        clear_messages(test_server);
        check_network_activity();
        REQUIRE_FALSE(has_messages(test_server));
    }
    TEST_CASE("close_all_connections_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(has_connection(string("test_connection")));
        close_all_connections();
        check_network_activity();
        REQUIRE_FALSE(has_connection(string("test_connection")));
    }
    TEST_CASE("close_all_servers_integration") {
        create_server(string("test_server_1"), 5000);
        ServerCleanup cleanup_server;
        create_server(string("test_server_2"), 5001);
        REQUIRE(has_server(string("test_server_1")));
        REQUIRE(has_server(string("test_server_2")));
        close_all_servers();
        REQUIRE_FALSE(has_server(string("test_server_1")));
        REQUIRE_FALSE(has_server(string("test_server_2")));
    }
    TEST_CASE("close_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 8080);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto close_result = close_connection(test_connection);
        REQUIRE(close_result);
        REQUIRE_FALSE(is_connection_open(test_connection));
    }
    TEST_CASE("close_connection_named_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 8080);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(is_connection_open(test_connection));
        auto close_result = close_connection(string("test_connection"));
        REQUIRE(close_result);
        REQUIRE_FALSE(is_connection_open(test_connection));
    }
    TEST_CASE("close_message_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(has_messages());
        auto test_message = read_message();
        REQUIRE(test_message != nullptr);
        close_message(test_message);
        REQUIRE_FALSE(has_messages());
    }
    TEST_CASE("close_server_named_integration") {
        create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto close_result = close_server(string("test_server"));
        REQUIRE(close_result);
        REQUIRE_FALSE(has_server(string("test_server")));
    }
    TEST_CASE("close_server_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto close_result = close_server(test_server);
        REQUIRE(close_result);
        REQUIRE_FALSE(has_server(string("test_server")));
    }
    TEST_CASE("connection_count_named_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(1u == connection_count(string("test_server")));
    }
    TEST_CASE("connection_count_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(1u == connection_count(test_server));
    }
    TEST_CASE("connection_ip_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto test_ip = connection_ip(test_connection);
        REQUIRE(2130706433u == test_ip);
    }
    TEST_CASE("connection_ip_from_name_integration") {
        auto test_server = create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 8080);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto test_ip = connection_ip(string("test_connection"));
        REQUIRE(2130706433u == test_ip);
    }
    TEST_CASE("connection_named_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto retrieved_connection = connection_named(string("test_connection"));
        REQUIRE(retrieved_connection != nullptr);
    }
    TEST_CASE("connection_port_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto test_port = connection_port(test_connection);
        REQUIRE(5000 == test_port);
    }
    TEST_CASE("connection_port_from_name_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto test_port = connection_port(string("test_connection"));
        REQUIRE(5000 == test_port);
    }
    TEST_CASE("create_server_with_port_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        REQUIRE(test_server != nullptr);
        REQUIRE(has_server(string("test_server")));
    }
    TEST_CASE("create_server_with_port_and_protocol_integration") {
        auto test_server = create_server(string("test_server"), 5000, ConnectionType::TCP);
        ServerCleanup cleanup_server;
        REQUIRE(test_server != nullptr);
        REQUIRE(has_server(string("test_server")));
    }
    TEST_CASE("dec_to_hex_integration") {
        auto test_hex_result = dec_to_hex(2130706433u);
        REQUIRE(string("0x7F000001") == test_hex_result);
    }
    TEST_CASE("fetch_new_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto new_connection = fetch_new_connection(test_server);
        REQUIRE(new_connection != nullptr);
    }
    TEST_CASE("has_connection_integration") {
        auto test_server = create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 8080);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(has_connection(string("test_connection")));
        close_connection(test_connection);
        REQUIRE_FALSE(has_connection(string("test_connection")));
    }
    TEST_CASE("has_messages_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE_FALSE(has_messages());
        send_message_to(string("test_message"), test_connection);
        check_network_activity();
        REQUIRE(has_messages());
    }
    TEST_CASE("has_messages_on_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(has_messages(test_connection));
    }
    TEST_CASE("has_messages_on_name_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(has_messages(string("test_server")));
    }
    TEST_CASE("has_messages_on_server_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(has_messages(test_server));
    }
    TEST_CASE("has_new_connections_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(has_new_connections());
    }
    TEST_CASE("has_server_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        REQUIRE(has_server(string("test_server")));
        close_server(test_server);
        REQUIRE_FALSE(has_server(string("test_server")));
    }
    TEST_CASE("hex_str_to_ipv4_integration") {
        auto test_ipv4 = hex_str_to_ipv4(string("0x7F000001"));
        REQUIRE(string("127.0.0.1") == test_ipv4);
        auto test_ipv4_no_prefix = hex_str_to_ipv4(string("7F000001"));
        REQUIRE(string("127.0.0.1") == test_ipv4_no_prefix);
    }
    TEST_CASE("hex_to_dec_string_integration") {
        auto test_result = hex_to_dec_string(string("7F"));
        REQUIRE(string("127") == test_result);
        auto test_result_with_prefix = hex_to_dec_string(string("0x7F"));
        REQUIRE(string("127") == test_result_with_prefix);
    }
    TEST_CASE("ipv4_to_dec_integration") {
        auto test_result1 = ipv4_to_dec(string("127.0.0.1"));
        REQUIRE(2130706433u == test_result1);
        auto test_result2 = ipv4_to_dec(string("192.168.1.1"));
        REQUIRE(3232235777 == test_result2);
    }
    TEST_CASE("ipv4_to_hex_integration") {
        auto test_ipv4_hex = ipv4_to_hex(string("127.0.0.1"));
        REQUIRE(string("0x7F000001") == test_ipv4_hex);
    }
    TEST_CASE("ipv4_to_str_integration") {
        auto test_ip_str = ipv4_to_str(2130706433u);
        REQUIRE(string("127.0.0.1") == test_ip_str);
    }
    TEST_CASE("is_connection_open_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(is_connection_open(test_connection));
        close_connection(test_connection);
        REQUIRE_FALSE(is_connection_open(test_connection));
    }
    TEST_CASE("is_connection_open_from_name_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(is_connection_open(string("test_connection")));
        close_connection(test_connection);
        REQUIRE_FALSE(is_connection_open(string("test_connection")));
    }
    TEST_CASE("last_connection_named_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto last_connection = last_connection(string("test_server"));
        REQUIRE(test_connection == last_connection);
    }
    TEST_CASE("last_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto last_connection = last_connection(test_server);
        REQUIRE(test_connection == last_connection);
    }
    TEST_CASE("message_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        auto test_message = read_message(test_server);
        REQUIRE(test_connection == message_connection(test_message));
        close_message(test_message);
    }
    TEST_CASE("message_count_on_server_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(1u == message_count(test_server));
    }
    TEST_CASE("message_count_on_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(message_count(test_connection) > 0);
    }
    TEST_CASE("message_count_from_name_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(1u == message_count(test_server));
    }
    TEST_CASE("message_data_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        auto test_message = read_message(test_server);
        REQUIRE(string("Test Message") == message_data(test_message));
        close_message(test_message);
    }
    TEST_CASE("message_data_bytes_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        auto test_message = read_message(test_server);
        auto test_message_bytes = message_data_bytes(test_message);
        REQUIRE(!test_message_bytes.empty());
        close_message(test_message);
    }
    TEST_CASE("message_host_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        auto test_message = read_message(test_server);
        REQUIRE(string("127.0.0.1") == message_host(test_message));
        close_message(test_message);
    }
    TEST_CASE("message_port_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        auto test_message = read_message(test_server);
        REQUIRE(5000 == message_port(test_message));
        close_message(test_message);
    }
    TEST_CASE("message_protocol_integration") {
        auto test_server = create_server(string("test_server"), 5000, ConnectionType::UDP);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000, ConnectionType::UDP);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        auto test_message = read_message(test_server);
        REQUIRE(ConnectionType::UDP == message_protocol(test_message));
        close_message(test_message);
    }
    TEST_CASE("my_ip_integration") {
        auto test_ip = my_ip();
        REQUIRE(string("127.0.0.1") == test_ip);
    }
    TEST_CASE("name_for_connection_integration") {
        auto test_connection_name = name_for_connection(string("localhost"), 8080u);
        REQUIRE(string("localhost:8080") == test_connection_name);
    }
    TEST_CASE("new_connection_count_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(1 == new_connection_count(test_server));
    }
    TEST_CASE("open_connection_integration") {
        auto test_server = create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 8080);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(test_connection != nullptr);
        REQUIRE(is_connection_open(test_connection));
        close_connection(test_connection);
        REQUIRE_FALSE(is_connection_open(test_connection));
    }
    TEST_CASE("open_connection_with_protocol_integration") {
        auto test_server = create_server(string("test_server"), 5000, ConnectionType::TCP);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000, ConnectionType::TCP);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(test_connection != nullptr);
    }
    TEST_CASE("read_message_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        auto test_message = read_message();
        REQUIRE(string("Test Message") == message_data(test_message));
        close_message(test_message);
    }
    TEST_CASE("read_message_from_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        auto test_message = read_message(test_connection);
        REQUIRE(string("Test Message") == message_data(test_message));
        close_message(test_message);
    }
    TEST_CASE("read_message_from_name_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        auto test_message = read_message(string("test_server"));
        REQUIRE(string("Test Message") == message_data(test_message));
        close_message(test_message);
    }
    TEST_CASE("read_message_from_server_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        auto test_message = read_message(test_server);
        REQUIRE(string("Test Message") == message_data(test_message));
        close_connection(test_connection);
        close_server(test_server);
        close_message(test_message);
    }
    TEST_CASE("read_message_data_from_name_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(string("Test Message") == read_message_data(string("test_server")));
    }
    TEST_CASE("read_message_data_from_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(string("Test Message") == read_message_data(test_connection));
    }
    TEST_CASE("read_message_data_from_server_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(string("Test Message") == read_message_data(test_server));
    }
    TEST_CASE("reconnect_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        close_connection(test_connection);
        check_network_activity();
        REQUIRE_FALSE(is_connection_open(test_connection));
        reconnect(test_connection);
        check_network_activity();
        REQUIRE(is_connection_open(test_connection));
    }
    TEST_CASE("reconnect_from_name_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        close_connection(test_connection);
        check_network_activity();
        REQUIRE_FALSE(is_connection_open(test_connection));
        reconnect(string("test_connection"));
        check_network_activity();
        REQUIRE(is_connection_open(string("test_connection")));
    }
    TEST_CASE("release_all_connections_integration") {
        create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
        open_connection(string("test_connection1"), string("127.0.0.1"), 8080);
        ConnectionCleanup cleanup_connection;
        open_connection(string("test_connection2"), string("127.0.0.1"), 8080);
        check_network_activity();
        REQUIRE(has_connection(string("test_connection1")));
        REQUIRE(has_connection(string("test_connection2")));
        release_all_connections();
        REQUIRE_FALSE(has_connection(string("test_connection1")));
        REQUIRE_FALSE(has_connection(string("test_connection2")));
        REQUIRE_FALSE(has_server(string("test_server")));
    }
    TEST_CASE("reset_new_connection_count_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(new_connection_count(test_server) == 1);
        reset_new_connection_count(test_server);
        REQUIRE(0 == new_connection_count(test_server));
    }
    TEST_CASE("retrieve_connection_named_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto retrieved_connection = retrieve_connection(string("test_connection"), 0);
        REQUIRE(test_connection == retrieved_connection);
    }
    TEST_CASE("retrieve_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto retrieved_connection = retrieve_connection(test_server, 0);
        REQUIRE(test_connection == retrieved_connection);
    }
    TEST_CASE("send_message_to_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto send_result = send_message_to(string("Test Message"), test_connection);
        check_network_activity();
        REQUIRE(send_result);
    }
    TEST_CASE("send_message_to_name_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto test_connection = open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        auto send_result = send_message_to(string("Test Message"), string("test_connection"));
        check_network_activity();
        REQUIRE(send_result);
    }
    TEST_CASE("server_has_new_connection_named_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(server_has_new_connection(string("test_server")));
    }
    TEST_CASE("server_has_new_connection_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        open_connection(string("test_connection"), string("127.0.0.1"), 5000);
        ConnectionCleanup cleanup_connection;
        check_network_activity();
        REQUIRE(server_has_new_connection(test_server));
    }
    TEST_CASE("server_named_integration") {
        auto test_server = create_server(string("test_server"), 5000);
        ServerCleanup cleanup_server;
        auto retrieved_server = server_named(string("test_server"));
        REQUIRE(test_server == retrieved_server);
    }
    TEST_CASE("set_udp_packet_size_integration") {
        set_udp_packet_size(1024u);
        REQUIRE(1024u == udp_packet_size());
    }
    TEST_CASE("udp_packet_size_integration") {
        auto test_packet_size = udp_packet_size();
        REQUIRE(test_packet_size > 0);
    }
    TEST_CASE("download_bitmap_integration") {
        auto test_server = create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = download_bitmap(string("test_image"), string("http://localhost:8080/test/resources/images/frog.png"), 80);
        REQUIRE(test_bitmap != nullptr);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("download_font_integration") {
        auto test_server = create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
        auto test_font = download_font(string("test_font"), string("http://localhost:8080/test/resources/fonts/hara.ttf"), 80);
        REQUIRE(test_font != nullptr);
    }
    TEST_CASE("download_music_integration") {
        auto test_server = create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
        auto test_music = download_music(string("test_music"), string("http://localhost:8080/test/resources/music/280.mp3"), 80);
        REQUIRE(test_music != nullptr);
    }
    TEST_CASE("download_sound_effect_integration") {
        auto test_server = create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
        auto test_sound_effect = download_sound_effect(string("test_sound"), string("http://localhost:8080/test/resources/sounds/breakdance.wav"), 80);
        REQUIRE(test_sound_effect != nullptr);
    }
    TEST_CASE("free_response_integration") {
        auto test_server = create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
        auto test_response = http_get(string("http://localhost:8080/test"), 80);
        REQUIRE(test_response != nullptr);
        free_response(test_response);
        REQUIRE(test_response == nullptr);
    }
    TEST_CASE("http_get_integration") {
        auto test_server = create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
        auto test_response = http_get(string("http://localhost:8080/test"), 80);
        REQUIRE(test_response != nullptr);
        auto response_text = http_response_to_string(test_response);
        REQUIRE(!response_text.empty());
        free_response(test_response);
    }
    TEST_CASE("http_post_with_headers_integration") {
        auto test_server = create_server(string("test_server"), 8080);
        ServerCleanup cleanup_server;
    auto headers = vector<string> { string("Content-Type: application/json"), string("Accept: application/json") };
    auto test_response = http_post(string("http://localhost:8080/test"), 80, string("Test Body"), headers);
    REQUIRE(test_response != nullptr);
    auto response_text = http_response_to_string(test_response);
    REQUIRE(contains(response_text, string("Test Body")));
    free_response(test_response);
}
TEST_CASE("http_post_integration") {
    auto test_server = create_server(string("test_server"), 8080);
    ServerCleanup cleanup_server;
    auto test_response = http_post(string("http://localhost:8080/test"), 80, string("Test Body"));
    REQUIRE(test_response != nullptr);
    auto response_text = http_response_to_string(test_response);
    REQUIRE(contains(response_text, string("Test Body")));
    free_response(test_response);
}
TEST_CASE("http_response_to_string_integration") {
    auto test_server = create_server(string("test_server"), 8080);
    ServerCleanup cleanup_server;
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto response_text = http_response_to_string(test_response);
    REQUIRE(!response_text.empty());
    free_response(test_response);
}
TEST_CASE("save_response_to_file_integration") {
    auto test_server = create_server(string("test_server"), 8080);
    ServerCleanup cleanup_server;
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_file = string("test_output.txt");
    save_response_to_file(test_response, test_file);
    free_response(test_response);
}
TEST_CASE("has_incoming_requests_integration") {
    auto test_server = start_web_server(8080);
    REQUIRE_FALSE(has_incoming_requests(test_server));
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    REQUIRE(has_incoming_requests(test_server));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("is_delete_request_for_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    REQUIRE(has_incoming_requests(test_server));
    auto test_request = next_web_request(test_server);
    REQUIRE_FALSE(is_delete_request_for(test_request, string("/test")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("is_get_request_for_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    REQUIRE(has_incoming_requests(test_server));
    auto test_request = next_web_request(test_server);
    REQUIRE(is_get_request_for(test_request, string("/test")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("is_options_request_for_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    REQUIRE(has_incoming_requests(test_server));
    auto test_request = next_web_request(test_server);
    REQUIRE_FALSE(is_options_request_for(test_request, string("/test")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("is_post_request_for_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_post(string("http://localhost:8080/test_path"), 80, string("test=123"));
    REQUIRE(has_incoming_requests(test_server));
    auto test_request = next_web_request(test_server);
    REQUIRE(is_post_request_for(test_request, string("/test_path")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("is_put_request_for_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    REQUIRE(has_incoming_requests(test_server));
    auto test_request = next_web_request(test_server);
    REQUIRE_FALSE(is_put_request_for(test_request, string("/test")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("is_request_for_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    REQUIRE(has_incoming_requests(test_server));
    auto test_request = next_web_request(test_server);
    REQUIRE(is_request_for(test_request, HttpMethod::HTTP_GET_METHOD, string("/test")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("is_trace_request_for_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    REQUIRE(has_incoming_requests(test_server));
    auto test_request = next_web_request(test_server);
    REQUIRE_FALSE(is_trace_request_for(test_request, string("/test")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("next_web_request_integration") {
    auto test_server = start_web_server(8080);
    REQUIRE_FALSE(has_incoming_requests(test_server));
    auto test_request = next_web_request(test_server);
    REQUIRE(test_request == nullptr);
    stop_web_server(test_server);
}
TEST_CASE("request_body_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_post(string("http://localhost:8080/test"), 80, string("test body"));
    auto test_request = next_web_request(test_server);
    REQUIRE(string("test body") == request_body(test_request));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("request_has_query_parameter_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test?param1=value1"), 80);
    auto test_request = next_web_request(test_server);
    REQUIRE(request_has_query_parameter(test_request, string("param1")));
    REQUIRE_FALSE(request_has_query_parameter(test_request, string("nonexistent_param")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("request_headers_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_request = next_web_request(test_server);
    REQUIRE(!request_headers(test_request).empty());
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("request_method_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_request = next_web_request(test_server);
    REQUIRE(HttpMethod::HTTP_GET_METHOD == request_method(test_request));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("request_query_parameter_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test?param1=value1"), 80);
    auto test_request = next_web_request(test_server);
    auto test_result = request_query_parameter(test_request, string("param1"), string("default_value"));
    REQUIRE(string("value1") == test_result);
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("request_query_string_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test?param1=value1"), 80);
    auto test_request = next_web_request(test_server);
    auto test_query_string = request_query_string(test_request);
    REQUIRE(string("param1=value1") == test_query_string);
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("request_uri_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_request = next_web_request(test_server);
    auto test_uri = request_uri(test_request);
    REQUIRE(string("/test") == test_uri);
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("request_uri_stubs_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test/path"), 80);
    auto test_request = next_web_request(test_server);
    auto test_stubs = request_uri_stubs(test_request);
    REQUIRE(vector<string> { string("test"), string("path") } == test_stubs);
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_css_file_response_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test.css"), 80);
    auto test_request = next_web_request(test_server);
    send_css_file_response(test_request, string("test.css"));
    REQUIRE(is_request_for(test_request, HttpMethod::HTTP_GET_METHOD, string("/test.css")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_file_response_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test.txt"), 80);
    auto test_request = next_web_request(test_server);
    send_file_response(test_request, string("test.txt"), string("text/plain"));
    REQUIRE(is_request_for(test_request, HttpMethod::HTTP_GET_METHOD, string("/test.txt")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_html_file_response_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test.html"), 80);
    auto test_request = next_web_request(test_server);
    send_html_file_response(test_request, string("test.html"));
    REQUIRE(is_request_for(test_request, HttpMethod::HTTP_GET_METHOD, string("/test.html")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_javascript_file_response_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test.js"), 80);
    auto test_request = next_web_request(test_server);
    send_javascript_file_response(test_request, string("test.js"));
    REQUIRE(is_request_for(test_request, HttpMethod::HTTP_GET_METHOD, string("/test.js")));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_response_empty_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_request = next_web_request(test_server);
    send_response(test_request);
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_response_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_request = next_web_request(test_server);
    send_response(test_request, string("Test Message"));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_response_json_with_status_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_request = next_web_request(test_server);
    send_response(test_request, HttpStatusCode::HTTP_STATUS_OK);
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_response_with_status_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_request = next_web_request(test_server);
    send_response(test_request, HttpStatusCode::HTTP_STATUS_OK, string("Test Message"));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_response_with_status_and_content_type_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_request = next_web_request(test_server);
    send_response(test_request, HttpStatusCode::HTTP_STATUS_OK, string("Test Message"), string("text/plain"));
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_response_with_status_and_content_type_and_headers_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_request = next_web_request(test_server);
    send_response(test_request, HttpStatusCode::HTTP_STATUS_OK, string("Test Message"), string("text/plain"), vector<string> { string("Header1: Value1"), string("Header2: Value2") });
    free_response(test_response);
    stop_web_server(test_server);
}
TEST_CASE("send_response_json_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    auto test_request = next_web_request(test_server);
    auto test_json = create_json();
    JsonCleanup cleanup_json;
    json_set_string(test_json, string("message"), string("Test Message"));
    send_response(test_request, test_json);
    free_response(test_response);
    free_json(test_json);
    stop_web_server(test_server);
}
TEST_CASE("split_uri_stubs_integration") {
    auto test_stubs = split_uri_stubs(string("/names/0"));
    REQUIRE(vector<auto> { string("names"), string("0") } == test_stubs);
    auto test_stubs_empty = split_uri_stubs(string("/"));
    REQUIRE(test_stubs_empty.empty());
}
TEST_CASE("start_web_server_with_default_port_integration") {
    auto test_server = start_web_server();
    REQUIRE(test_server != nullptr);
    stop_web_server(test_server);
}
TEST_CASE("start_web_server_integration") {
    auto test_server = start_web_server(8080);
    REQUIRE(test_server != nullptr);
    stop_web_server(test_server);
}
TEST_CASE("stop_web_server_integration") {
    auto test_server = start_web_server(8080);
    auto test_response = http_get(string("http://localhost:8080/test"), 80);
    REQUIRE(has_incoming_requests(test_server));
    free_response(test_response);
    stop_web_server(test_server);
}
};
