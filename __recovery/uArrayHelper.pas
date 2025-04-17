unit uArrayHelper;

interface

uses
  System.SysUtils, System.Classes;

type
   TArrayHelper = class
   private

   public
      class function CreateRandom(Length: Int64) : TArray<Integer>;
      class function IsInAscendingOrder(const AArray: array of Integer): Boolean;
      class function ArrayToString(const Arr: array of Integer; const Delimiter: string = ', '): String;
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

class function TArrayHelper.ArrayToString(const Arr: array of Integer; const Delimiter: string = ', '): string;
var
  StringBuilder: TStringBuilder;
  i: Integer;
begin
  StringBuilder := TStringBuilder.Create;
  try
    for i := Low(Arr) to High(Arr) do
    begin
      StringBuilder.Append(IntToStr(Arr[i]));
      if i < High(Arr) then
        StringBuilder.Append(Delimiter);
    end;
    Result := StringBuilder.ToString;
  finally
    StringBuilder.Free;
  end;
end;

end.
