class BinaryTree

  @@dfs_output = []

  def self.defult_tree
    $ta = TreeNode.new('a')
    $tb = TreeNode.new('b')
    $tc = TreeNode.new('c')
    $td = TreeNode.new('d')
    $te = TreeNode.new('e')
    $tf = TreeNode.new('f')

    $ta.left = $tb
    $ta.right = $tc

    $tb.left = $td
    $tb.right = $tf

    $tc.left = $te

    $tf.left = $te

  end

  def self.dfs(root)
    @@dfs_output = []

    self.dfsi(root)

    return @@dfs_output
  end

  def self.dfsi(root) #inorder

    self.dfsi(root.left) if !root.left.nil?

    @@dfs_output.push(root.val) if !@@dfs_output.include?(root.val)

    self.dfsi(root.right) if !root.right.nil?
  end


  def self.dfs2(root) #iterate
    @@dfs_output = []

  end
end
