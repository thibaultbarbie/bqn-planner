# n LinSample a‿b will gives [a, a+0.001, a+0.002, (n times), b]
LinSample ← {n←𝕨 ÷˜ ⟜(¯1×-´)𝕩 ⋄ (1⊑𝕩)∾˜ ⍉ (⊑𝕩)+ n× (≠⊑𝕩)‿𝕨 ⥊ (⊢∾⊢)⟜↕ 𝕨}
radius_squared ← 0.03 ⋄ obs ← 0.5‿0.5
DistSqr ←  {+´2⋆˜𝕨-𝕩}
Col←{0<radius_squared - obs DistSqr 𝕩}
# TODO the TransitionCol function should use the resolution parameter (eps)
TransitionCol ← {∨´ Col˘ (10 LinSample 𝕩)}

s ← 2 •rand.Range 0  ⋄  g ← 2 •rand.Range 0

# ≢trees = [2, 2, size_of_each_tree]
# trees is composed of start tree and goal tree. A tree is made of two lists: the list of index of q_list to reference which node we are talking about, and the list of parent of the tree.
trees ← ⟨ ⟨⟨0⟩, ⟨0⟩⟩, ⟨⟨1⟩,⟨0⟩⟩ ⟩
q_list ← ⟨⟨0.8, 0.1⟩, ⟨0.15, 0.9⟩⟩

# 𝕩: The node to be compared with, 𝕨: the specific tree (not the parent tree)
# Output the index of the nearest node to 𝕩 in the tree 𝕨 (example: k not 𝕨[k])
NearestNeighbor ← {⊑(⊢⊐⌊´) (𝕨⊏q_list) DistSqr¨ <𝕩 }

# 𝕩: the node to be added, 𝕨=(t, p): the index of the tree and the index of the parent
AddNode ← { t‿p←𝕨 ⋄ trees ∾⟜(≠q_list)⌾(⊑(t⊸⊑))↩ ⋄ trees ∾⟜(p)⌾(1⊑(t⊸⊑))↩ ⋄q_list ∾⟜(<𝕩)↩}

# 𝕩: the node q we extend toward, the index of the tree considered, the maximum distance
Extend  ← {
  q‿t‿d_max ← 𝕩 
  p ← ((⊑t⊑trees) NearestNeighbor q) ⋄ q_near ← (p⊑⊑t⊑ trees) ⊑ q_list  
    
  dist ← √ (+´2⋆˜ q - q_near)
  q_new ← (d_max≤dist)  ⊑ q‿(q_near + dist÷˜d_max×(q - q_near))
  col ← TransitionCol q_near‿q_new
    
  { col ? @ ; (t‿p) AddNode q_new}
  col‿(¬ d_max≤dist)
}

# 𝕩: the node q we extend toward, the index of the tree considered, the maximum distance
Connect ← {q‿t‿d_max ← 𝕩 ⋄ a ← Extend q‿(¬t)‿d_max ⋄ 𝕊⍟(¬∨´ a) 𝕩 ⋄ d ← 1⊑a ⋄ d}

# 𝕩: the index of the parent, 𝕨: the parent tree considered
Path ← {𝕩 = 0 ? 𝕩; 𝕩∾ (𝕨𝕊 (𝕩⊑𝕨))}
  
RRTConnect ← {
  d_max ← 0.01 ⋄ n‿solved‿path_sol ← 𝕩 ⋄ t ← (2|n)
  
  q_rand ← 2 •rand.Range 0

  {¬solved ?
    solved ↩ { ¬⊑(Extend q_rand‿t‿d_max) ? Connect (⊑¯1↑q_list)‿t‿d_max ; 0 }

    {solved ? 
      a ← (1⊑t⊑trees) Path ⊑¯1↑1⊑t⊑trees ⋄ b ← (1⊑(¬t)⊑trees) Path ⊑¯1↑1⊑(¬t)⊑trees
    
      path_sol ↩ {t ? ((⌽b⊏⊑(¬t)⊑trees)∾(a⊏⊑t⊑trees) )⊏q_list ;
                      ((⌽a⊏⊑t⊑trees)∾(b⊏⊑(¬t)⊑trees) )⊏q_list}
      ; @
    }

    (1+n)‿solved‿path_sol;
    n‿solved‿path_sol
  }
  
}

iter‿solved‿path_sol ← RRTConnect⍟2000 0‿0‿0
•Show  Col¨ path_sol

J ← ∾1↓·⥊<⊸(≍˘)
#•Show (<",") J¨ •Repr¨¨ path_sol
"a.test" •file.Lines (<",") J¨ •Repr¨¨ path_sol
