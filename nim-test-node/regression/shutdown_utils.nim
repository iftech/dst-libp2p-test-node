import chronos
import ./env

proc waitShutdownSignal*() {.async.} =
  if inShadow:
    # Shadow cannot register signal handlers; it stops the process at sim end.
    await newFuture[void]("waitShutdownSignal.shadow")
    return
  let
    sigIntFut = waitSignal(SIGINT)
    sigTermFut = waitSignal(SIGTERM)

  try:
    let completedSignalFut = await one(sigIntFut, sigTermFut)
    await completedSignalFut
  finally:
    if not sigIntFut.finished():
      await noCancel(sigIntFut.cancelAndWait())
    if not sigTermFut.finished():
      await noCancel(sigTermFut.cancelAndWait())
