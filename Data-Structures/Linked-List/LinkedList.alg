
MODE NODE = STRUCT(DATA data, REF NODE prev, REF NODE next);
MODE LIST = STRUCT(REF NODE head, REF NODE tail);

#******************************************************************************#
#/* Adds a node to the beginning of the list */#
PROC prepend = (REF LIST list, DATA data) VOID:
(
    HEAP NODE n := (data, NIL, NIL);
    IF head OF list IS REF NODE(NIL) THEN
        head OF list := tail OF list := n
    ELSE
        next OF n := head OF list;
        prev OF head OF list := head OF list := n
    FI
);
#******************************************************************************#
#/* Adds a node to the end of the list */#
PROC append = (REF LIST list, DATA data) VOID:
(
    HEAP NODE n := (data, NIL, NIL);
    IF head OF list IS REF NODE(NIL) THEN
        head OF list := tail OF list := n
    ELSE
        prev OF n := tail OF list;
        next OF tail OF list := tail OF list := n
    FI
);


#******************************************************************************#
#/* removes the node at the end of the list */#
PROC remove last = (REF LIST list) DATA:
(
    DATA emp := data OF tail OF list;
    next OF prev OF tail OF list := NIL;
    tail OF list := prev OF tail OF list;
    emp
);
#******************************************************************************#
#/* removes the node at the end of the list */#
PROC remove first = (REF LIST list) DATA:
(
    DATA emp := data OF head OF list;
    prev OF next OF head OF list := NIL;
    head OF list := next OF head OF list;
    emp
);


#******************************************************************************#
#/* returns the data at the end of the list */#
PROC get last = (REF LIST list) DATA: (  data OF tail OF list  );
#******************************************************************************#
#/* returns the data at the front of the list */#
PROC get first = (REF LIST list) DATA: (  data OF head OF list  );


#******************************************************************************#
#/* Traverses through the list forwards */#
PROC forward traversal = (LIST list) VOID:
(
    REF NODE travel := head OF list;
    WHILE travel ISNT REF NODE(NIL) DO
        list visit(data OF travel);
        travel := next OF travel
    OD
);
#******************************************************************************#
#/* Traverses through the list backwards */#
PROC backward traversal = (LIST list) VOID:
(
    REF NODE travel := tail OF list;
    WHILE travel ISNT REF NODE(NIL) DO
        list visit(data OF travel);
        travel := prev OF travel
    OD
)