EnsureSConsVersion(2, 3, 0)

env = Environment().Clone()

Export( "env" )

VariantDir( 'build/src', 'src', duplicate = 0 )
VariantDir( 'build/app', 'app', duplicate = 0 )

SConscript( [
    'build/src/SConscript',
    'build/app/SConscript',
] )
