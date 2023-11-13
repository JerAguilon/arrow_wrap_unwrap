# distutils: language=c++

import pyarrow as pa
import pyarrow.acero as pac
import pyarrow.compute as pc

from pyarrow.lib cimport *
from pyarrow.lib_compute cimport *
from pyarrow.lib_acero cimport *

def unwrap_wrap_arr(obj):
    cdef shared_ptr[CArray] arr = pyarrow_unwrap_array(obj)
    if arr.get() == NULL:
        raise TypeError("not an array")
    print("unwrapped array")
    out = pyarrow_wrap_array(arr)
    print("wrapped arr array")
    return out

def unwrap_wrap_declaration(declaration):
    cdef CDeclaration decl = pyarrow_unwrap_declaration(declaration)
    output = pyarrow_wrap_declaration(decl)
    print(output)
    return output

def unwrap_wrap_options(options):
    cdef shared_ptr[CExecNodeOptions] decl = pyarrow_unwrap_exec_node_options(options)
    print("unwrapped options")
    output = pyarrow_wrap_exec_node_options(decl)
    print(output)
    print("wrapped options")
    return output

def unwrap_wrap_expression(expression):
    cdef CExpression expr = pyarrow_unwrap_expression(expression)
    print("unwrapped expression")
    output = pyarrow_wrap_expression(expr)
    print(output)
    print("wrapped expression")
    return output


def run_test():
    print("starting")
    arr = pa.array(["a", "b", "a"])
    arr = unwrap_wrap_arr(arr)


    table = pa.Table.from_arrays([arr], names=["foo"])

    expression = (pc.field("foo") == pc.scalar("a")) 
    expression = unwrap_wrap_expression(expression)
    table = table.filter(expression)

    options = pac.TableSourceNodeOptions(table)
    print(options)
    options = unwrap_wrap_options(options)
    print(options)


    source_node = pac.Declaration("table_source", options, [])
    source_node = unwrap_wrap_declaration(source_node)
    print(source_node.to_table())

