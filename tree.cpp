#include <string>
#include <vector>
#include <stack>

using namespace std;

struct TreeNode
{
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution
{
public:
    void preorderRecursionTraversal(TreeNode *root)
    {
        ;
        if (root == nullptr)
        {
            return;
        }
        printf("%d", root->val);
        preorderRecursionTraversal(root->left);
        preorderRecursionTraversal(root->right);
    }

    void inorderRecursionTraversal(TreeNode *root)
    {
        if (root == nullptr)
        {
            return;
        }
        inorderRecursionTraversal(root->left);
        printf("%d", root->val);
        inorderRecursionTraversal(root->right);
    }

    void postorderRecursionTraversal(TreeNode *root)
    {
        if (root == nullptr)
        {
            return;
        }
        postorderRecursionTraversal(root->left);
        postorderRecursionTraversal(root->right);
        printf("%d", root->val);
    }

    void preorderTraversal(TreeNode *root)
    {
        stack<TreeNode *> stack;
        TreeNode *node = root;
        while (true) {
            if (node != nullptr) {
                printf("%d", node->val);    
                stack.push(node->right);
                node = node->left;
            } else {
                if (stack.empty()) {
                    break;
                }
                node = stack.top();
                stack.pop();
            }
        }
    }

    void inorderTraversal(TreeNode *root)
    {
        stack<TreeNode *> stack;
        TreeNode *node = root;

        while (true) {
            if (node == nullptr) {
                if (stack.empty()) {
                    break;
                }    
                node = stack.top();
                stack.pop();
                printf("%d", node->val);
                node = node->right;
            } else {
                stack.push(node);
                node = node->left;
            }
        }
    }

    void postorderTraversal(TreeNode *root)
    {
        stack<TreeNode *> stack1;
        stack<TreeNode *> stack2;

        TreeNode *node = root;

        while (true) {
            if (node != nullptr) {
                stack1.push(node->left);
                stack2.push(node);
                node = node->right;
            } else {
                if (stack1.empty()) {
                    break;
                }
                node = stack1.top();
                stack1.pop();
            }
        }

        while (!stack2.empty()) {
            node = stack2.top();
            stack2.pop();
            printf("%d", node->val);
        }
    }
};

/*
*         1
*         /\
*        2  3
*        /\ /\
*       4 5  67
*       /
*      8
*
*    pre   12485367
*
*    in    84251637
*
*    post  84526731
*/

int main()
{
    Solution st = Solution();

    TreeNode t1 = TreeNode(1);
    TreeNode t2 = TreeNode(2);
    TreeNode t3 = TreeNode(3);
    TreeNode t4 = TreeNode(4);
    TreeNode t5 = TreeNode(5);
    TreeNode t6 = TreeNode(6);
    TreeNode t7 = TreeNode(7);
    TreeNode t8 = TreeNode(8);

    t1.left = &t2;
    t1.right = &t3;

    t2.left = &t4;
    t2.right = &t5;

    t3.left = &t6;
    t3.right = &t7;

    t4.left = &t8;

    // st.preorderRecursionTraversal(&t1);
    // st.inorderRecursionTraversal(&t1);
    // st.postorderRecursionTraversal(&t1);
    // st.preorderTraversal(&t1);
    // st.inorderTraversal(&t1);
    // st.postorderTraversal(&t1);

    return 0;
}
