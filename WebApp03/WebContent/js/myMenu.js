/**
 * myMenu.js
 */

/*
function myMenu1()
{
	
}

function myMenu2()
{
	
}
*/

function myMenu(status)
{
	var menu = document.getElementById("menuTable");
	
	if(status == 1)
	{
			menu.style.display = "block";
	}
	else
	{
		menu.style.display = "none";
	}
}
//.style -->css, display --> css의 display속성에서  block ->블록단위로 렌더링하겠다..inline(인라인속성으로 렌더링하겠다..)




