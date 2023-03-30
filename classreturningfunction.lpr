program classreturningfunction;

{$mode objfpc}{$H+}

type
  TPerson = class
    private
      FName: String;
      FAge: Integer;
    public
      constructor Create(AName: String; AAge: Integer);
      function GetName: String;
      function GetAge: Integer;
  end;

function CreatePerson(AName: String; AAge: Integer): TPerson;
begin
  Result := TPerson.Create(AName, AAge);
end;

constructor TPerson.Create(AName: String; AAge: Integer);
begin
  FName := AName;
  FAge := AAge;
end;

function TPerson.GetName: String;
begin
  Result := FName;
end;

//nodemon --exec D:\XDRIVE\LAZLAB6\fpc\bin\x86_64-win64\fpc .\classreturningfunction.lpr

function TPerson.GetAge: Integer;
begin
  Result := FAge;
end;


var
  Person: TPerson;
begin
  Person := CreatePerson('John Doe', 25);
  writeln('Name: ', Person.GetName);
  writeln('Age: ', Person.GetAge);
  readln;
end.

