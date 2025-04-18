unit ifIntegerSort;

interface

type
  TIntegerProc = procedure(const Param: Integer) of object;

type
  IIntegerSort = Interface
  procedure Sort(AArray: TArray<Integer>);
end;

implementation

end.
