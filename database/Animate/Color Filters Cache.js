// add color filter to clipfunction colorClip(clip, rMult, gMult, bMult, rAdd, gAdd, bAdd) {    var nb = clip.nominalBounds;    clip.filters = [ new createjs.ColorFilter(rMult, gMult, bMult, 1, rAdd, gAdd, bAdd, 0) ];    clip.cache(nb.x, nb.y, nb.width, nb.height);}// remove all color filters from clipfunction removeFilters(clip) {    if (!!clip.filters) {        clip.filters = [];        clip.uncache();    }}// examplecolorClip(this.testClip, 0.5, 0.5, 0.5, 255, 0, 0);