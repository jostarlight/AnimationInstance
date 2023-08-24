using System.Collections.Generic;
using UnityEngine;

public class test : MonoBehaviour
{
    [SerializeField] Transform root1;
    [SerializeField] Transform root2;
    [SerializeField] Transform root3;
    [SerializeField] Transform root4;

    private string inputText1 = "90";
    private string inputText2 = "30";
    private string inputText3 = "90";
    private string inputText4 = "30";

    private List<AnimationInstancing.AnimationInstancing> animationInstancings = new();
    private List<GameObject> YWanimationInstancings = new();

    private List<Animator> animators = new();
    private List<GameObject> YWanimators = new();

    private void Awake()
    {
        Application.targetFrameRate = 60;
    }
    /*
        private void OnGUI()
        {
            GUILayout.BeginArea(new Rect(100, 50, 150, 2000));
            GUILayout.Label("using animation Instance");

            GUILayout.Label("需要生成airensheshou_skin的数量");
            inputText1 = GUILayout.TextField(inputText1, 25);

            if (GUILayout.Button("Gen airensheshou_skin", GUILayout.Width(150), GUILayout.Height(50)))
            {
                var go = Resources.Load<GameObject>("Arts/RoleRelated/RoleInstances/Prefabs/airensheshou_skin");
                for (int i = 0; i < int.Parse(inputText1); i++)
                {
                    var inst = AnimationInstancing.AnimationInstancingMgr.Instance.CreateInstance(go);
                    inst.transform.SetParent(root1);
                    inst.transform.localPosition = Vector3.zero;
                    if (inst.TryGetComponent<AnimationInstancing.AnimationInstancing>(out var animationInstancing))
                    {
                        animationInstancings.Add(animationInstancing);
                        animationInstancing.defaultAnimation = "idle";
                    }
                }
            }
            if (GUILayout.Button("显示/隐藏: " + root1.gameObject.activeSelf, GUILayout.Width(150), GUILayout.Height(50)))
            {
                root1.gameObject.SetActive(!root1.gameObject.activeSelf);
            }
            GUILayout.Label("当前airensheshou_skin数量：" + animationInstancings.Count);

            GUILayout.Label("需要生成airenzhanshi_skin_Group的数量");
            inputText2 = GUILayout.TextField(inputText2, 25);
            if (GUILayout.Button("Gen airenzhanshi_skin_Group", GUILayout.Width(150), GUILayout.Height(50)))
            {
                var go = Resources.Load<GameObject>("Arts/RoleRelated/RoleInstances/YW_Prefabs/airenzhanshi_skin_Group");
                for (int j = 0; j < int.Parse(inputText2); j++)
                {
                    var inst = Instantiate(go, root2);
                    YWanimationInstancings.Add(inst);
                    var anis = inst.GetComponentsInChildren<AnimationInstancing.AnimationInstancing>();
                    for (int i = 0; i < anis.Length; i++)
                    {
                        anis[i].defaultAnimation = "idle";
                        anis[i].PlayAnimation("idle");
                    }
                }
            }
            if (GUILayout.Button("显示/隐藏: " + root2.gameObject.activeSelf, GUILayout.Width(150), GUILayout.Height(50)))
            {
                root2.gameObject.SetActive(!root2.gameObject.activeSelf);
            }
            GUILayout.Label("当前airenzhanshi_skin_Group数量：" + YWanimationInstancings.Count);


            GUILayout.Label("当前AnimationInstance数量：" + (YWanimationInstancings.Count * 3 + animationInstancings.Count));

            GUIStyle style = new GUIStyle(GUI.skin.label);
            style.normal.textColor = Color.red;
            style.fontSize = 30;

            int frameRate = (int)(1.0f / Time.smoothDeltaTime);
            GUILayout.Label("Frame Rate: " + frameRate.ToString(), style);

            GUILayout.EndArea();


            GUILayout.BeginArea(new Rect(300, 50, 150, 2000));
            GUILayout.Label("using skinmeshrenderer");

            GUILayout.Label("需要生成airensheshou_skin的数量");
            inputText3 = GUILayout.TextField(inputText3, 25);

            if (GUILayout.Button("Gen airensheshou_skin", GUILayout.Width(150), GUILayout.Height(50)))
            {
                var go = Resources.Load<GameObject>("Arts/RoleRelated/Roles/Prefabs/airensheshou_skin");
                for (int i = 0; i < int.Parse(inputText3); i++)
                {
                    var inst = Instantiate(go, root3);
                    if (inst.TryGetComponent<Animator>(out var animator))
                    {
                        animator.Play("idle");
                        animators.Add(animator);
                    }
                }
            }
            if (GUILayout.Button("显示/隐藏: " + root3.gameObject.activeSelf, GUILayout.Width(150), GUILayout.Height(50)))
            {
                root3.gameObject.SetActive(!root3.gameObject.activeSelf);
            }
            GUILayout.Label("当前airensheshou_skin数量：" + animators.Count);


            GUILayout.Label("需要生成airenzhanshi_skin_Group的数量");
            inputText4 = GUILayout.TextField(inputText4, 25);
            if (GUILayout.Button("Gen airenzhanshi_skin_Group", GUILayout.Width(150), GUILayout.Height(50)))
            {
                var go = Resources.Load<GameObject>("Arts/RoleRelated/Roles/YW_Prefabs/airenzhanshi_skin_Group");
                for (int j = 0; j < int.Parse(inputText4); j++)
                {
                    var inst = Instantiate(go, root4);
                    YWanimators.Add(inst);
                    var anis = inst.GetComponentsInChildren<Animator>();
                    for (int i = 0; i < anis.Length; i++)
                    {
                        anis[i].Play("idle");
                    }
                }
            }
            if (GUILayout.Button("显示/隐藏: " + root4.gameObject.activeSelf, GUILayout.Width(150), GUILayout.Height(50)))
            {
                root4.gameObject.SetActive(!root4.gameObject.activeSelf);
            }
            GUILayout.Label("当前airenzhanshi_skin_Group数量：" + YWanimators.Count);


            GUILayout.Label("当前Animator数量：" + (YWanimators.Count * 3 + animators.Count));

            GUILayout.EndArea();
        }
    */
    private void OnGUI()
    {
        GUILayout.BeginArea(new Rect(100, 50, 300, 2000));
        GUILayout.Label("using animation Instance");

        if (GUILayout.Button("Gen airensheshou_skin", GUILayout.Width(300), GUILayout.Height(50)))
        {
            var go = Resources.Load<GameObject>("Arts/RoleRelated/RoleInstances/Prefabs/airensheshou_skin");
            for (int i = 0; i < int.Parse(inputText1); i++)
            {
                var inst = AnimationInstancing.AnimationInstancingMgr.Instance.CreateInstance(go);
                inst.transform.SetParent(root1);
                inst.transform.localPosition = Vector3.zero;
                if (inst.TryGetComponent<AnimationInstancing.AnimationInstancing>(out var animationInstancing))
                {
                    animationInstancings.Add(animationInstancing);
                    animationInstancing.defaultAnimation = "idle";
                }
            }
        }
        if (GUILayout.Button("显示/隐藏: " + root1.gameObject.activeSelf, GUILayout.Width(300), GUILayout.Height(50)))
        {
            root1.gameObject.SetActive(!root1.gameObject.activeSelf);
        }
        GUILayout.Label("当前airensheshou_skin数量：" + animationInstancings.Count);


        GUIStyle style = new GUIStyle(GUI.skin.label);
        style.normal.textColor = Color.red;
        style.fontSize = 30;

        int frameRate = (int)(1.0f / Time.smoothDeltaTime);
        GUILayout.Label("Frame Rate: " + frameRate.ToString(), style);

        GUILayout.EndArea();


        GUILayout.BeginArea(new Rect(450, 50, 300, 2000));
        GUILayout.Label("using skinmeshrenderer");

        if (GUILayout.Button("Gen airensheshou_skin", GUILayout.Width(300), GUILayout.Height(50)))
        {
            var go = Resources.Load<GameObject>("Arts/RoleRelated/Roles/Prefabs/airensheshou_skin");
            for (int i = 0; i < int.Parse(inputText3); i++)
            {
                var inst = Instantiate(go, root3);
                if (inst.TryGetComponent<Animator>(out var animator))
                {
                    animator.Play("idle");
                    animators.Add(animator);
                }
            }
        }
        if (GUILayout.Button("显示/隐藏: " + root3.gameObject.activeSelf, GUILayout.Width(300), GUILayout.Height(50)))
        {
            root3.gameObject.SetActive(!root3.gameObject.activeSelf);
        }
        GUILayout.Label("当前airensheshou_skin数量：" + animators.Count);

        if (GUILayout.Button("Increase", GUILayout.Width(300), GUILayout.Height(50)))
        {
            AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/AssetBundle/shaders.ab");
            var ab = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/AssetBundle/model.ab");
            var go = ab.LoadAllAssets()[0] as GameObject;
            AnimationInstancing.AnimationInstancingMgr.Instance.CreateInstance(go);
        }

        GUILayout.EndArea();
    }
}
