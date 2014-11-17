program test_protocol;

{$mode objfpc}{$H+}

uses
  rd_protocol,  eventlog, sysutils, rd_commands
  { you can add units after this };

var
   redis   : TRedisIO;
   command : TRedisDBCommands;
   Log     : TEventLog;
   cmd     : String;
   answer  : string;

begin
  redis                := TRedisIO.Create;
  command              := TRedisDBCommands.Create(redis);
  log                  := TEventLog.Create(nil);
  Log.FileName         := ExtractFilePath(ParamStr(0)) + 'debug.log';
  Log.LogType          := ltFile;
  Log.AppendContent    := false;
  Log.DefaultEventType := etDebug;
  Log.Active           := true;
  redis.Log            := Log;
  redis.Connect;
  cmd                  := command.build_raw_command('ECHO', ['"Hello World"']);
  answer               := redis.raw_send_command(cmd);
  writeln(answer);
  cmd                  := command.build_raw_command('INFO', []);
  answer               := redis.raw_send_command(cmd);
  writeln(answer);
  redis.Disconnect;
  redis.Free;
  command.Free;
  log.Free;
end.

