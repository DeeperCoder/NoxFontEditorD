unit Globals;

interface
function IntToBin(value: LongInt; digits: Integer): string;
function BinToInt(value: String): LongInt;

Const
  NFE_Version = '0.99a';

implementation

function IntToBin(value: LongInt; digits: Integer): string;
begin
  result := StringOfChar('0', digits);
  while value > 0 do
  begin
    if (value and 1) = 1 then
      result[digits] := '1';
    dec(digits);
    value := value shr 1;
  end;
end;

function BinToInt(value: String): LongInt;
var
  i: Integer;
begin
  result := 0;
  // remove leading zeroes
  while Copy(value, 1, 1) = '0' do
    value := Copy(value, 2, Length(value) - 1);
  // do the conversion
  for i := Length(value) downto 1 do
    if Copy(value, i, 1) = '1' then
      result := result + (1 shl (Length(value) - i));
end;

end.
