MAINNAME := 	main
OBJDIR	:= 	.
INCLUDE_DIR	:=	/usr/include
LIB_NAME	:=	func
LIB_VERSION	:=	1
LINK_FLAGS =	-Wall	-o #FLAGS DE LINKAGEM
COMP_FLAGS =	-c	#FLASG DE COMPILAÇÃO
LIB_FLAGS =	-shared	-o	#FLAGS PARA A CRIAÇÃO DA BIBLIOTECA
LIBDIR = 	/usr/lib

dinamico:	install	main

main:	object
	gcc	$(LINK_FLAGS)	$(MAINNAME)	$(MAINNAME).c		-L$(LIBDIR)	-l$(LIB_NAME)
object:
	cp	$(LIB_NAME).h	$(LIBDIR)/$(LIB_NAME).h
	gcc	$(COMP_FLAGS)	$(OBJDIR)/*.c
install:	object
	gcc	$(LIB_FLAGS)	$(LIB_NAME).so	$(LIB_NAME).o
	ln	-fs	$(OBJDIR)/$(LIB_NAME).so	$(LIBDIR)/$(LIB_NAME).so.01
	rm	-f	$(OBJDIR)/*.so
	rm	-f	$(OBJDIR)/*.so.01
clear:
	rm	-f	$(OBJDIR)/*.o
	rm	-f	$(OBJDIR)/$(MAINNAME).o
	rm	-f	$(OBJDIR)/$(MAINNAME)
	rm	-f	$(OBJDIR)/*.so
	rm	-f	$(OBJDIR)/*.so.01
