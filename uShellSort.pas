unit uShellSort;

interface

uses
  System.Math, ifIntegerSort, System.SysUtils;

type
   TShellSort = class(TInterfacedObject, IIntegerSort)

   public
      SortIterationCallback: TProc;

      procedure Sort(AArray: TArray<Integer>);
      procedure OnIteration();
   end;

implementation

procedure TShellSort.OnIteration();
begin
   if Assigned(SortIterationCallback) then
     SortIterationCallback();
end;

procedure TShellSort.Sort(AArray: TArray<Integer>);
var
  ArrayLength: Int64;
  H: Integer;
  I: Integer;
  Temp: Integer;
  J: Integer;
begin
  H := 0;
  I := 0;
  Temp := 0;
  J := 0;

  ArrayLength := Length(AArray);

  while H < (ArrayLength / 3) do
    H := 3 * H + 1;

  SetRoundMode(rmTruncate);

  while H >= 1 do
    begin
    //repeat

    //until I < N;

      for I := H to (ArrayLength - 1) do
        begin
            Temp := AArray[I];
            J := I;

            while (J >= H) and (AArray[J - H] > Temp) do
              begin
                 AArray[J] := AArray[J - H];
                 OnIteration();
                 J := J - H;
              end;

            AArray[J] := Temp;
            OnIteration();
        end;

      H := Round( H / 3 );
    end;
end;

end.
