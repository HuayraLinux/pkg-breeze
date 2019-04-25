#!/usr/bin/env python
# -*- coding: utf-8 -*-

import glob
import argparse
import os.path

def get_template(content):
    template = []
    for line in content.split('\n'):
        if line:
            data = line.split(' ')
            if data[3].startswith('x1'):
                template.append(data)
    return template

def gen_config(content, size=[1, 2, 3, 4]):
    output = []

    for l in get_template(content):
        for t in size:
            try:
                line = (
                    int(l[0]) * t,
                    int(l[1]) * t,
                    int(l[2]) * t,
                    l[3].replace('x1', 'x{0}'.format(t)),
                    l[4]
                )
            except IndexError:
                line = (
                    int(l[0]) * t,
                    int(l[1]) * t,
                    int(l[2]) * t,
                    l[3].replace('x1', 'x{0}'.format(t))
                )

            output.append(line)

    output.sort()

    output_str = ''

    for o in output:
        if len(o) == 5:
            output_str += '{0} {1} {2} {3} {4}\n'.format(
                o[0],
                o[1],
                o[2],
                o[3],
                o[4]
            )
        else:
            output_str += '{0} {1} {2} {3}\n'.format(
                o[0],
                o[1],
                o[2],
                o[3]
            )
    return output_str

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("ruta",
                        help='Carpeta con los iconos.',
                        nargs='?',
                        default='./'
    )
    args = parser.parse_args()

    for file_name in glob.glob(os.path.join(args.ruta, '*.cursor')):
        print 'Procesando {0}'.format(file_name)

        with open(file_name, 'r') as fp:
            data = gen_config(fp.read())

        with open(file_name, 'w') as fp:
            fp.write(data)
