unit uThreading;

interface

uses
  uLogging, System.Classes, System.Generics.Collections, System.SysUtils;

type
  TThreadScheduler = class(TThread)
    public
      procedure ExecuteNow(Task: TProc);
      constructor Create;
      procedure ExecuteTask(Task: TProc);
    private
      WorkThread: TThread;
      TaskQueue: TList<TProc>;
      IsTerminated: BOOLEAN;
  end;

implementation

procedure TThreadScheduler.ExecuteNow(Task: TProc);
begin
  TaskQueue.Add(Task);
end;

procedure TThreadScheduler.ExecuteTask(Task: TProc);
begin

end;

constructor TThreadScheduler.Create;
var
  Task: TProc;
  TaskList: TList;
begin

  inherited Create(true);

  TaskQueue := TList<TProc>.Create;

  WorkThread := TThread.CreateAnonymousThread(
    procedure
    begin
      while not Terminated do
      begin
        // TODO: Add synchronization
        try
          if TaskQueue.Count > 0 then
          begin
            Task := TaskQueue[0];
            Task();

            TaskQueue.Delete(0);
          end
          else
            Sleep(10);
        finally
          //TaskQueue.UnlockList;
        end;
      end;
    end
  );

  WorkThread.FreeOnTerminate := False;

  WorkThread.Start;
end;
end.
