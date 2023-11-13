# arrow_wrap_unwrap

This is some arbitrary code to demonstrate wrapping/unwrapping `pyarrow.compute.Expression`,
`pyarrow.acero.Declaration`, and `pyarrow.acero.ExecNodeOptions`.


This is an accompaniment to https://github.com/apache/arrow/pull/38649/files
Instructions:

```
python setup.py build_ext --inplace

./run_demo.py
```

Expected output:    

```
starting
unwrapped array
wrapped arr array
unwrapped expression
(foo == "a")
wrapped expression
<pyarrow._acero.TableSourceNodeOptions object at 0x1315c5b20>
unwrapped options
<pyarrow._acero.ExecNodeOptions object at 0x12fbd6430>
wrapped options
<pyarrow._acero.ExecNodeOptions object at 0x12fbd6430>
ExecPlan with 2 nodes:
:ConsumingSinkNode{}
  :TableSourceNode{}

pyarrow.Table
foo: string
----
foo: [["a","a"]]
```
