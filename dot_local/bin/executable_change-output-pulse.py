#!/usr/bin/env python3

import subprocess


def runCmd(cmd):
    ret = subprocess.run(cmd.split(), stdout = subprocess.PIPE)
    return ret.stdout.decode('utf-8')

if __name__ == '__main__':
    sinks_tmp = runCmd('pactl list short sinks')

    # Scrape sinks, find active sink
    new_sink = None
    for line in sinks_tmp.splitlines():
        delim_line = line.split()
        if delim_line[6] != 'RUNNING':
            new_sink = delim_line[0]

    # Find all streams, add ones to move to list
    streams_tmp = runCmd('pactl list short sink-inputs')
    streams = []
    for line in streams_tmp.splitlines():
        delim_line = line.split()
        if delim_line[0] != new_sink:
            streams.append(delim_line[0])

    # Set new default stream & move existing streams
    runCmd('pactl set-default-sink {}'.format(new_sink))
    for i in streams:
        runCmd('pactl move-sink-input {} {}'.format(i, new_sink))
