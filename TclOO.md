# Object name namespace and internal namespace

object's internal namespace is always in ::oo
object's name namespace is inside the current namespace where it was created.
i.e., if an object is created inside another object, its name resides in parent's internal namespace


% oo::define oo::object method create x {oo::object create $x}
% oo::object create o1
::o1
% o1 create o2
::oo::Obj11::o2
% o1 create o3
::oo::Obj11::o3
% info object namespace ::oo::Obj11::o2
::oo::Obj12
% info object namespace ::oo::Obj11::o3
::oo::Obj13
% namespace eval ::N oo::object create o1
::N::o1
% namespace eval ::N o1 create o2
::oo::Obj14::o2
% namespace eval ::N ::oo::Obj14::o2 create o3
::oo::Obj15::o3
% info object namespace ::oo::Obj14::o2
::oo::Obj15
% info object namespace ::oo::Obj15::o3
::oo::Obj16
