The correct way to remove ALL the children from a given container is either a backward loop that removes at the given moment the last child:for (var i = mainContainer.numChildren - 1; i >= 0; i--) {    mainContainer.removeChildAt(i);}Or a while loop that removes children at depth 0 while there are any:while (mainContainer.numChildren > 0){    mainContainer.removeChildAt(0);}However, there's a much simpler way to empty a container (available from Flash Player 11 and on):mainContainer.removeChildren();