# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(marker_msgs_CONFIG_INCLUDED)
  return()
endif()
set(marker_msgs_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(marker_msgs_SOURCE_PREFIX /media/victoria/Nuevo vol/Universidad de Alicante/4º Curso/1º Cuatrimestre/33732 - ROBOTS MÓVILES/Prácticas/Práctica 2/código/moviles_P2/catkin_ws/src/marker_msgs)
  set(marker_msgs_DEVEL_PREFIX /media/victoria/Nuevo vol/Universidad de Alicante/4º Curso/1º Cuatrimestre/33732 - ROBOTS MÓVILES/Prácticas/Práctica 2/código/moviles_P2/catkin_ws/devel)
  set(marker_msgs_INSTALL_PREFIX "")
  set(marker_msgs_PREFIX ${marker_msgs_DEVEL_PREFIX})
else()
  set(marker_msgs_SOURCE_PREFIX "")
  set(marker_msgs_DEVEL_PREFIX "")
  set(marker_msgs_INSTALL_PREFIX /media/victoria/Nuevo vol/Universidad de Alicante/4º Curso/1º Cuatrimestre/33732 - ROBOTS MÓVILES/Prácticas/Práctica 2/código/moviles_P2/catkin_ws/install)
  set(marker_msgs_PREFIX ${marker_msgs_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'marker_msgs' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(marker_msgs_FOUND_CATKIN_PROJECT TRUE)

if(NOT "/media/victoria/Nuevo vol/Universidad de Alicante/4º Curso/1º Cuatrimestre/33732 - ROBOTS MÓVILES/Prácticas/Práctica 2/código/moviles_P2/catkin_ws/devel/include " STREQUAL " ")
  set(marker_msgs_INCLUDE_DIRS "")
  set(_include_dirs "/media/victoria/Nuevo vol/Universidad de Alicante/4º Curso/1º Cuatrimestre/33732 - ROBOTS MÓVILES/Prácticas/Práctica 2/código/moviles_P2/catkin_ws/devel/include")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://wiki.ros.org/marker_msgs " STREQUAL " ")
    set(_report "Check the website 'http://wiki.ros.org/marker_msgs' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Markus Bader <markus.bader@tuwien.ac.at>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${marker_msgs_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'marker_msgs' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'marker_msgs' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/media/victoria/Nuevo vol/Universidad de Alicante/4º Curso/1º Cuatrimestre/33732 - ROBOTS MÓVILES/Prácticas/Práctica 2/código/moviles_P2/catkin_ws/src/marker_msgs/${idir}'.  ${_report}")
    endif()
    _list_append_unique(marker_msgs_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND marker_msgs_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND marker_msgs_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT marker_msgs_NUM_DUMMY_TARGETS)
      set(marker_msgs_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::marker_msgs::wrapped-linker-option${marker_msgs_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR marker_msgs_NUM_DUMMY_TARGETS "${marker_msgs_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::marker_msgs::wrapped-linker-option${marker_msgs_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND marker_msgs_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND marker_msgs_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND marker_msgs_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /media/victoria/Nuevo vol/Universidad de Alicante/4º Curso/1º Cuatrimestre/33732 - ROBOTS MÓVILES/Prácticas/Práctica 2/código/moviles_P2/catkin_ws/devel/lib;/home/victoria/tb2_ws/devel_isolated/yujin_ocs/lib;/home/victoria/tb2_ws/devel_isolated/yocs_waypoints_navi/lib;/home/victoria/tb2_ws/devel_isolated/yocs_waypoint_provider/lib;/home/victoria/tb2_ws/devel_isolated/yocs_virtual_sensor/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_qtestsuite/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_testsuite/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_node/lib;/home/victoria/tb2_ws/devel_isolated/yocs_velocity_smoother/lib;/home/victoria/tb2_ws/devel_isolated/yocs_safety_controller/lib;/home/victoria/tb2_ws/devel_isolated/yocs_rapps/lib;/home/victoria/tb2_ws/devel_isolated/yocs_navigator/lib;/home/victoria/tb2_ws/devel_isolated/yocs_navi_toolkit/lib;/home/victoria/tb2_ws/devel_isolated/yocs_joyop/lib;/home/victoria/tb2_ws/devel_isolated/yocs_ar_pair_tracking/lib;/home/victoria/tb2_ws/devel_isolated/yocs_msgs/lib;/home/victoria/tb2_ws/devel_isolated/yocs_diff_drive_pose_controller/lib;/home/victoria/tb2_ws/devel_isolated/yocs_ar_marker_tracking/lib;/home/victoria/tb2_ws/devel_isolated/yocs_math_toolkit/lib;/home/victoria/tb2_ws/devel_isolated/yocs_localization_manager/lib;/home/victoria/tb2_ws/devel_isolated/yocs_keyop/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_safety_controller/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_random_walker/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_controller_tutorial/lib;/home/victoria/tb2_ws/devel_isolated/yocs_controllers/lib;/home/victoria/tb2_ws/devel_isolated/yocs_cmd_vel_mux/lib;/home/victoria/tb2_ws/devel_isolated/yocs_ar_pair_approach/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_teleop/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_stdr/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_stage/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_simulator/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_rviz_launchers/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_rapps/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_navigation/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_follower/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_msgs/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_interactive_markers/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_interactions/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_gazebo/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_description/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_dashboard/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_capabilities/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_calibration/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_bringup/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_apps/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot_actions/lib;/home/victoria/tb2_ws/devel_isolated/turtlebot/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_driver/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_auto_docking/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_dock_drive/lib;/home/victoria/tb2_ws/devel_isolated/ecl_statistics/lib;/home/victoria/tb2_ws/devel_isolated/ecl_mobile_robot/lib;/home/victoria/tb2_ws/devel_isolated/ecl_core_apps/lib;/home/victoria/tb2_ws/devel_isolated/ecl_geometry/lib;/home/victoria/tb2_ws/devel_isolated/ecl_linear_algebra/lib;/home/victoria/tb2_ws/devel_isolated/slam_gmapping/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_rviz_launchers/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_rapps/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_keyop/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_gazebo_plugins/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_dashboard/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_bumper2pc/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_msgs/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_gazebo/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_ftdi/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_desktop/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_description/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_core/lib;/home/victoria/tb2_ws/devel_isolated/kobuki_capabilities/lib;/home/victoria/tb2_ws/devel_isolated/kobuki/lib;/home/victoria/tb2_ws/devel_isolated/gmapping/lib;/home/victoria/tb2_ws/devel_isolated/ecl_streams/lib;/home/victoria/tb2_ws/devel_isolated/ecl_sigslots/lib;/home/victoria/tb2_ws/devel_isolated/ecl_devices/lib;/home/victoria/tb2_ws/devel_isolated/ecl_threads/lib;/home/victoria/tb2_ws/devel_isolated/ecl_containers/lib;/home/victoria/tb2_ws/devel_isolated/ecl_utilities/lib;/home/victoria/tb2_ws/devel_isolated/ecl_math/lib;/home/victoria/tb2_ws/devel_isolated/ecl_formatters/lib;/home/victoria/tb2_ws/devel_isolated/ecl_converters/lib;/home/victoria/tb2_ws/devel_isolated/ecl_concepts/lib;/home/victoria/tb2_ws/devel_isolated/ecl_type_traits/lib;/home/victoria/tb2_ws/devel_isolated/ecl_tools/lib;/home/victoria/tb2_ws/devel_isolated/ecl_ipc/lib;/home/victoria/tb2_ws/devel_isolated/ecl_time/lib;/home/victoria/tb2_ws/devel_isolated/ecl_time_lite/lib;/home/victoria/tb2_ws/devel_isolated/ecl_sigslots_lite/lib;/home/victoria/tb2_ws/devel_isolated/ecl_navigation/lib;/home/victoria/tb2_ws/devel_isolated/ecl_mpl/lib;/home/victoria/tb2_ws/devel_isolated/ecl_lite/lib;/home/victoria/tb2_ws/devel_isolated/ecl_io/lib;/home/victoria/tb2_ws/devel_isolated/ecl_filesystem/lib;/home/victoria/tb2_ws/devel_isolated/ecl_exceptions/lib;/home/victoria/tb2_ws/devel_isolated/ecl_errors/lib;/home/victoria/tb2_ws/devel_isolated/ecl_eigen/lib;/home/victoria/tb2_ws/devel_isolated/ecl_converters_lite/lib;/home/victoria/tb2_ws/devel_isolated/ecl_console/lib;/home/victoria/tb2_ws/devel_isolated/ecl_config/lib;/home/victoria/tb2_ws/devel_isolated/ecl_command_line/lib;/home/victoria/tb2_ws/devel_isolated/ecl_build/lib;/home/victoria/tb2_ws/devel_isolated/ecl_license/lib;/home/victoria/tb2_ws/devel_isolated/ecl_core/lib;/home/victoria/tb2_ws/devel_isolated/depthimage_to_laserscan/lib;/home/victoria/tb2_ws/devel_isolated/ddynamic_reconfigure/lib;/home/victoria/tb2_ws/devel_isolated/ar_track_alvar_msgs/lib;/opt/ros/noetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(marker_msgs_LIBRARY_DIRS ${lib_path})
      list(APPEND marker_msgs_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'marker_msgs'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND marker_msgs_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(marker_msgs_EXPORTED_TARGETS "marker_msgs_generate_messages_cpp;marker_msgs_generate_messages_eus;marker_msgs_generate_messages_lisp;marker_msgs_generate_messages_nodejs;marker_msgs_generate_messages_py")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${marker_msgs_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "geometry_msgs;message_runtime;std_msgs")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 marker_msgs_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${marker_msgs_dep}_FOUND)
      find_package(${marker_msgs_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${marker_msgs_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(marker_msgs_INCLUDE_DIRS ${${marker_msgs_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(marker_msgs_LIBRARIES ${marker_msgs_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${marker_msgs_dep}_LIBRARIES})
  _list_append_deduplicate(marker_msgs_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(marker_msgs_LIBRARIES ${marker_msgs_LIBRARIES})

  _list_append_unique(marker_msgs_LIBRARY_DIRS ${${marker_msgs_dep}_LIBRARY_DIRS})
  _list_append_deduplicate(marker_msgs_EXPORTED_TARGETS ${${marker_msgs_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "marker_msgs-msg-extras.cmake")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${marker_msgs_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
