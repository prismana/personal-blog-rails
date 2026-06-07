module BlogPostsHelper
    # Helper
    def truncate_body(body, length=100)
        body.length > length ? body[0...length] + "..." : body
    end
end