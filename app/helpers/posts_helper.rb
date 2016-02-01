module PostsHelper
	def post_params
		params.require(:post).permit(:title, :gif, :votes)
	end
end
