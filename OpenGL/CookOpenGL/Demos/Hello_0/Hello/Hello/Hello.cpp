// Hello.cpp: 定义控制台应用程序的入口点。

#include "stdafx.h"

#include <iostream>
using namespace std;
#include <windows.h>
#include <gl/glew.h>
#include <gl/glut.h>


void SetupRC()
{
	// Black background
	glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
}

void RenderScene(void)
{
	// Clear the window with current clearing color
	glClear(GL_COLOR_BUFFER_BIT);
	// Flush drawing commands
	glutSwapBuffers();
}

int main(int argc, char* argv[])
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA);
	glutInitWindowSize(800, 600);
	glutCreateWindow("GL_Test");
	glutDisplayFunc(RenderScene);
	SetupRC();
	glutMainLoop();
	return 0;
}