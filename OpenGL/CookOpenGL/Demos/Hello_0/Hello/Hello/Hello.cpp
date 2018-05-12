// Hello.cpp: 定义控制台应用程序的入口点。

//#pragma comment(lib,"glew32sd.lib")

#include "stdafx.h"
#include <iostream>
using namespace std;
#include <windows.h>
// 没有则报错，有空研究一下
#define GLEW_STATIC
#include <gl/glew.h>
#include <gl/glut.h>
#include<gl/glew.h>

// Shaders
const GLchar* vertexShaderSource = "#version 330 core\n"
"layout (location = 0) in vec3 position;\n"
"void main()\n"
"{\n"
"gl_Position = vec4(position.x, position.y, position.z, 1.0);\n"
"}\0";

const GLchar* fragmentShaderSource = "#version 330 core\n"
"out vec4 color;\n"
"void main()\n"
"{\n"
"color = vec4(1.0f, 0.5f, 0.2f, 1.0f);\n"
"}\n\0";



GLfloat vertices[] = {
	0.5f,  0.5f, 0.0f,  // Top Right
	0.5f, -0.5f, 0.0f,  // Bottom Right
	-0.5f, -0.5f, 0.0f,  // Bottom Left
	-0.5f,  0.5f, 0.0f   // Top Left 
};
GLuint indices[] = {  // Note that we start from 0!
	0, 1, 3,  // First Triangle
	1, 2, 3   // Second Triangle
};
// VBO(Vertex buffer object)float数据（ 坐标、UV、法线、颜色、索引）
// VAO(Vertex array object) 顶点数组对象（定义了顶点属性）
GLuint VBO, VAO, EBO;

GLuint shaderProgram;
void  InitShaders()
{
	// Vertex shader
	// 创建shader（使用glew库，须包含glew.h和glew32.lib）
	GLuint vertexShader = glCreateShader(GL_VERTEX_SHADER);
	// 向shader中导入着色器程序(shader的handler，数组中的字符串数量，字符串数组，字符串长度数组（注意如果是NULL则字符串以NULL结尾）)
	glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
	// 编译shader。将着色器程序编译成shader可识别的程序
	glCompileShader(vertexShader);
	// Check for compile time errors
	GLint success;
	GLchar infoLog[512];
	// 用于调试（编译阶段）
	glGetShaderiv(vertexShader, GL_COMPILE_STATUS, &success);
	if (!success)
	{
		// 获取编译错误
		glGetShaderInfoLog(vertexShader, 512, NULL, infoLog);
		std::cout << "ERROR::SHADER::VERTEX::COMPILATION_FAILED\n" << infoLog << std::endl;
	}
	// Fragment shader
	GLuint fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
	glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);
	glCompileShader(fragmentShader);
	glGetShaderiv(fragmentShader, GL_COMPILE_STATUS, &success);
	if (!success)
	{
		glGetShaderInfoLog(fragmentShader, 512, NULL, infoLog);
		std::cout << "ERROR::SHADER::FRAGMENT::COMPILATION_FAILED\n" << infoLog << std::endl;
	}
	// 创建 着色器程序容器（如成功 返回着色器程序id）
	shaderProgram = glCreateProgram();
	glAttachShader(shaderProgram, vertexShader);
	glAttachShader(shaderProgram, fragmentShader);
	// 链接程序（着色器容器id）
	glLinkProgram(shaderProgram);
	// 用于调试（连接阶段）
	glGetProgramiv(shaderProgram, GL_LINK_STATUS, &success);
	if (!success) {
		glGetProgramInfoLog(shaderProgram, 512, NULL, infoLog);
		std::cout << "ERROR::SHADER::PROGRAM::LINKING_FAILED\n" << infoLog << std::endl;
	}
	// 释放shader资源
	glDeleteShader(vertexShader);
	glDeleteShader(fragmentShader);
}


void InitData()
{
	glGenVertexArrays(1, &VAO);
	// 创建缓冲器
	glGenBuffers(1, &VBO);
	glGenBuffers(1, &EBO);
	glBindVertexArray(VAO);
	// 绑定缓冲器
	glBindBuffer(GL_ARRAY_BUFFER, VBO);
	// 给VBO指定相应的类型。绑定顶点数据(拷贝数据到缓冲中)
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);
	// 设置管线解析缓冲中数据的方式
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(GLfloat), (GLvoid*)0);
	// 禁用 顶点数组对象
	glEnableVertexAttribArray(0);
	// 绑定缓冲
	glBindBuffer(GL_ARRAY_BUFFER, 0);
	// 禁用 顶点缓冲对象
	glBindVertexArray(0);
}

void SetupRC()
{
	// Black background
	glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
	InitData();
	InitShaders();
}

void RenderScene(void)
{
	// 清除颜色缓存
	glClear(GL_COLOR_BUFFER_BIT);
	// 加载并使用链接好的程序(着色器程序的id),id为0表示固定功能管线。
	glUseProgram(shaderProgram);
	glBindVertexArray(VAO);
	//glDrawArrays(GL_TRIANGLES, 0, 6);
	// （GL_TRIANGLES，三角形面片数，GL_UNSIGNED_INT，三角形索引数组）
	glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
	glBindVertexArray(0);
	// 与glFlush()效果等价 专用于双缓冲渲染。（glFlush(),不储运于渲染缓冲区，强制直接输出结果）
	glutSwapBuffers();
}

int main(int argc, char* argv[])
{
	// 初始化GLUT
	glutInit(&argc, argv);
	// GLUT_DOUBLE:开启双缓冲机制，交替显示;GLUT_RGBA:颜色缓冲
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA);
	// 窗口大小
	glutInitWindowSize(800, 600);
	// 窗口位置
	glutInitWindowPosition(200, 200);
	// 窗口标题
	glutCreateWindow("GL_Test");
	glewInit();   GLenum err = glewInit();// 前面运行了glut*的一系列函数，已经获得了opengl的context，所以这里不会出错，如果在main的开始就调用就会有问题
	// GLUT提供的主回调之一，用以完成一帧图像的渲染工作，将会被GLUT内部循环调用
	glutDisplayFunc(RenderScene);
	SetupRC();
	// 通知GLUT开始内部循环，调用注册的RenderScene
	glutMainLoop();
	return 0;
}
