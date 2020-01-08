# rst插入代码

```
To show example code, use the reStructured Text code-block directive:
前面也要有一个空行
.. code-block:: language
这里有一行空格，是留给写codeblock的控制参数的，不能写代码
   code 这里的每一行，后面有空格也会warning
By specifying the language, you enable pygments, which show syntax color coding for that code sample. (Ensure that your project conf.py file contains pygments_style = 'sphinx').


.. note::
(此处必有空格或table)    Always use **evolve**  to do the TDDFT calculation, otherwise all the parameters listed below will not be read.


Band projection 
=======================================后面不能跟空格或其他字符
:math:`重音符两侧也不要有多余的空格`

```

```
编译结果奇怪时，make clean一下再make
```