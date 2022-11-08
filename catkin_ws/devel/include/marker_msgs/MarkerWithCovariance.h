// Generated by gencpp from file marker_msgs/MarkerWithCovariance.msg
// DO NOT EDIT!


#ifndef MARKER_MSGS_MESSAGE_MARKERWITHCOVARIANCE_H
#define MARKER_MSGS_MESSAGE_MARKERWITHCOVARIANCE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <marker_msgs/Marker.h>

namespace marker_msgs
{
template <class ContainerAllocator>
struct MarkerWithCovariance_
{
  typedef MarkerWithCovariance_<ContainerAllocator> Type;

  MarkerWithCovariance_()
    : marker()
    , covariance()  {
      covariance.assign(0.0);
  }
  MarkerWithCovariance_(const ContainerAllocator& _alloc)
    : marker(_alloc)
    , covariance()  {
  (void)_alloc;
      covariance.assign(0.0);
  }



   typedef  ::marker_msgs::Marker_<ContainerAllocator>  _marker_type;
  _marker_type marker;

   typedef boost::array<double, 36>  _covariance_type;
  _covariance_type covariance;





  typedef boost::shared_ptr< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> const> ConstPtr;

}; // struct MarkerWithCovariance_

typedef ::marker_msgs::MarkerWithCovariance_<std::allocator<void> > MarkerWithCovariance;

typedef boost::shared_ptr< ::marker_msgs::MarkerWithCovariance > MarkerWithCovariancePtr;
typedef boost::shared_ptr< ::marker_msgs::MarkerWithCovariance const> MarkerWithCovarianceConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::marker_msgs::MarkerWithCovariance_<ContainerAllocator1> & lhs, const ::marker_msgs::MarkerWithCovariance_<ContainerAllocator2> & rhs)
{
  return lhs.marker == rhs.marker &&
    lhs.covariance == rhs.covariance;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::marker_msgs::MarkerWithCovariance_<ContainerAllocator1> & lhs, const ::marker_msgs::MarkerWithCovariance_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace marker_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ace241bc4ec8f4b399c13e05763be31a";
  }

  static const char* value(const ::marker_msgs::MarkerWithCovariance_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xace241bc4ec8f4b3ULL;
  static const uint64_t static_value2 = 0x99c13e05763be31aULL;
};

template<class ContainerAllocator>
struct DataType< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> >
{
  static const char* value()
  {
    return "marker_msgs/MarkerWithCovariance";
  }

  static const char* value(const ::marker_msgs::MarkerWithCovariance_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# This expresses a marker in free space with uncertainty.\n"
"\n"
"Marker marker\n"
"\n"
"# Row-major representation of the 6x6 covariance matrix\n"
"# The orientation parameters use a fixed-axis representation.\n"
"# In order, the parameters are:\n"
"# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n"
"float64[36] covariance\n"
"\n"
"================================================================================\n"
"MSG: marker_msgs/Marker\n"
"# This expresses a marker/fiducial in a 3D space\n"
"int32[] ids                  # possible ids of the detected fiducial (empty if no id could be identified)\n"
"float64[] ids_confidence     # confidence of the possible ids in [0, 1]\n"
"geometry_msgs/Pose pose      # pose of the detected marker/fiducial\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
;
  }

  static const char* value(const ::marker_msgs::MarkerWithCovariance_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.marker);
      stream.next(m.covariance);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MarkerWithCovariance_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::marker_msgs::MarkerWithCovariance_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::marker_msgs::MarkerWithCovariance_<ContainerAllocator>& v)
  {
    s << indent << "marker: ";
    s << std::endl;
    Printer< ::marker_msgs::Marker_<ContainerAllocator> >::stream(s, indent + "  ", v.marker);
    s << indent << "covariance[]" << std::endl;
    for (size_t i = 0; i < v.covariance.size(); ++i)
    {
      s << indent << "  covariance[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.covariance[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MARKER_MSGS_MESSAGE_MARKERWITHCOVARIANCE_H
