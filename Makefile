CC	=	gcc

CXX =	g++

RM	=	rm -f

CFLAGS	+=	-Wextra	-Wall -Werror

CXXFLAGS	+=	-Wextra	-Wall -Werror -fPIC

LDFLAGS		+=	-ldl


NAME_USER_CXX	=	./user/lib_cpp.so

SRCS_USER_CXX	=	./src/cpp/main.cpp 	\

OBJS_USER_CXX	=	$(SRCS:.cpp=.o)


NAME_USER_C	=	./user/lib_c.so

SRCS_USER_C	=	./src/c/main.c 	\

OBJS_USER_C	=	$(SRCS:.c=.o)



all	:	$(NAME_USER_C) $(NAME_USER_CXX)

$(NAME_USER_CXX)	:	$(OBJS_USER_CXX)
						$(CXX) -shared -o $(NAME) $(OBJS_USER_CXX)

$(NAME_USER_C)	:	$(OBJS_USER_C)
					$(CC) -shared -o $(NAME) $(OBJS_USER_C)


clean		:
				$(RM) $(OBJS_USER_C) $(OBJS_USER_CXX)

fclean		:	clean
				$(RM) $(NAME_USER_C) $(NAME_USER_CXX)

re			: 	fclean all

.PHONY		:	all clean fclean re