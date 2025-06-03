cmake_minimum_required(VERSION 3.10)
project(network_connectivity_bridge_plugin LANGUAGES CXX)

set(BINARY_NAME "network_connectivity_bridge_plugin")
add_library(${BINARY_NAME} SHARED
  "network_connectivity_bridge_plugin.cpp"
  "network_connectivity_bridge_plugin.h"
)
target_link_libraries(${BINARY_NAME} PRIVATE flutter) 