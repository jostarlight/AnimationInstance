using System.Collections.Generic;
using UnityEngine;

public class test : MonoBehaviour
{
    [SerializeField] Transform root1;
    [SerializeField] Transform root2;
    [SerializeField] Transform root3;
    [SerializeField] Transform root4;

    private string inputText1 = "";
    private string inputText2 = "";
    private string inputText3 = "";
    private string inputText4 = "";

    private List<AnimationInstancing.AnimationInstancing> animationInstancings = new();
    private List<GameObject> YWanimationInstancings = new();

    private List<Animator> animators = new();
    private List<GameObject> YWanimators = new();

    private void Awake()
    {
        Application.targetFrameRate = 60;
    }

    private void OnGUI()
    {
        GUILayout.BeginArea(new Rect(100, 100, 300, 2000));
        GUILayout.Label("using animation Instance");

        GUILayout.Label("需要生成airensheshou_skin的数量");
        inputText1 = GUILayout.TextField(inputText1, 25);

        if (GUILayout.Button("Gen airensheshou_skin"))
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
        if (GUILayout.Button("显示/隐藏airensheshou_skin: " + root1.gameObject.activeSelf))
        {
            root1.gameObject.SetActive(!root1.gameObject.activeSelf);
        }
        GUILayout.Label("当前airensheshou_skin数量：" + animationInstancings.Count);

        GUILayout.Space(20);

        GUILayout.Label("需要生成airenzhanshi_skin_Group的数量,其中有三个airenzhanshi_skin");
        inputText2 = GUILayout.TextField(inputText2, 25);
        if (GUILayout.Button("Gen airenzhanshi_skin_Group"))
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
        if (GUILayout.Button("显示/隐藏airenzhanshi_skin_Group: " + root2.gameObject.activeSelf))
        {
            root2.gameObject.SetActive(!root2.gameObject.activeSelf);
        }
        GUILayout.Label("当前airenzhanshi_skin_Group数量：" + YWanimationInstancings.Count);

        GUILayout.Space(10);

        GUILayout.Label("当前AnimationInstance数量：" + (YWanimationInstancings.Count * 3 + animationInstancings.Count));
        int frameRate = (int)(1.0f / Time.smoothDeltaTime);
        GUILayout.Label("Frame Rate: " + frameRate.ToString());

        GUILayout.EndArea();


        GUILayout.BeginArea(new Rect(500, 100, 300, 2000));
        GUILayout.Label("using skinmeshrenderer");

        GUILayout.Label("需要生成airensheshou_skin的数量");
        inputText3 = GUILayout.TextField(inputText3, 25);

        if (GUILayout.Button("Gen airensheshou_skin"))
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
        if (GUILayout.Button("显示/隐藏airensheshou_skin: " + root3.gameObject.activeSelf))
        {
            root3.gameObject.SetActive(!root3.gameObject.activeSelf);
        }
        GUILayout.Label("当前airensheshou_skin数量：" + animators.Count);

        GUILayout.Space(20);

        GUILayout.Label("需要生成airenzhanshi_skin_Group的数量,其中有三个airenzhanshi_skin");
        inputText4 = GUILayout.TextField(inputText4, 25);
        if (GUILayout.Button("Gen airenzhanshi_skin_Group"))
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
        if (GUILayout.Button("显示/隐藏airenzhanshi_skin_Group: " + root4.gameObject.activeSelf))
        {
            root4.gameObject.SetActive(!root4.gameObject.activeSelf);
        }
        GUILayout.Label("当前airenzhanshi_skin_Group数量：" + YWanimators.Count);

        GUILayout.Space(10);

        GUILayout.Label("当前Animator数量：" + (YWanimators.Count * 3 + animators.Count));

        GUILayout.EndArea();
    }

}
