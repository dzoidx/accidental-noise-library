-- Accidental Noise Library
-- Generate basic Value noise illustration

b1=anl.CImplicitBasisFunction(anl.GRADIENT, anl.QUINTIC, false)
b2=anl.CImplicitBasisFunction(anl.GRADIENT, anl.CUBIC, false)
b3=anl.CImplicitBasisFunction(anl.GRADIENT, anl.LINEAR, false)
b4=anl.CImplicitBasisFunction(anl.GRADIENT, anl.NONE, false)

ac1=anl.CImplicitAutoCorrect(b1,0,1)
ac2=anl.CImplicitAutoCorrect(b2,0,1)
ac3=anl.CImplicitAutoCorrect(b3,0,1)
ac4=anl.CImplicitAutoCorrect(b4,0,1)

grad=anl.CImplicitGradient(0,16,0,0)

sel1=anl.CImplicitSelect(ac4,ac3,grad, 0.25, 0)
sel2=anl.CImplicitSelect(sel1,ac2,grad,0.5,0)
sel3=anl.CImplicitSelect(sel2,ac1,grad,0.75,0)

ad=anl.CImplicitBufferImplicitAdapter(sel3, anl.SEAMLESS_NONE, anl.SMappingRanges(0,16,0,4,0,4), false, 0)
scale=anl.CImplicitBufferScaleToRange(ad, 0, 1)



i=anl.CArray2Dd()
i:resize(1024,256)

scale:get(i)

anl.saveDoubleArray("img.png", i)

