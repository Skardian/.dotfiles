#!/usr/bin/env python2

from json import loads
from os import popen
from sys import argv


def ipc_query(req="command", msg=""):
    ans = popen("i3-msg -t " + req + " " + msg).readlines()[0]
    return loads(ans)

if __name__ == "__main__":
    # Usage & checking args
    if len(argv) != 2:
        print "Usage: switch-workspace.py name-of-workspace"
        exit(-1)

    new_workspace = argv[1]

    # Retrieving active display
    active_display = None
    for w in ipc_query(req="get_workspaces"):
        if w['focused']:
            active_display = w['output']

    # Moving workspace to active display
    print ipc_query(msg="\
                    'workspace {0};\
                     move workspace to output {1}';\
                     workspace {0}"
                    .format(new_workspace,
                            active_display)
                    )
