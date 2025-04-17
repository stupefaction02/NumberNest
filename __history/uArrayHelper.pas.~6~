unit uArrayHelper;

interface

type
   TArrayHelper = class
   private

   public
      class function CreateRandom(Length: Int64) : TArray<Integer>;
      class function IsInAscendingOrder(const AArray: array of Integer): Boolean;
   end;

implementation

class function TArrayHelper.CreateRandom(Length: Int64): TArray<Integer>;
var
  lArray: TArray<Integer>;
  i: Integer;
begin
    SetLength(lArray, Length);

    for i := 0 to Length - 1 do
      begin
        lArray[i] := 10 + Random(100);
      end;

    Result := lArray;
end;

class function TArrayHelper.IsInAscendingOrder(const AArray: array of Integer): Boolean;
var
  Previous: Integer;
  I: Integer;
  ArrayItem: Integer;
begin
  for I := Low(AArray) to High(AArray) do
    begin
      ArrayItem := AArray[I];

      if ArrayItem < Previous then
        Exit(False)
      else
        Previous := ArrayItem;
    end;
  Exit(True);
end;
end.
