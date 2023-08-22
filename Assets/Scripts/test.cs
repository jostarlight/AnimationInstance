using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.Video;

public class test : MonoBehaviour
{
    [SerializeField] Transform root1;
    [SerializeField] Transform root2;

    private string inputText1 = "";
    private string inputText2 = "";

    private List<AnimationInstancing.AnimationInstancing> animationInstancings = new();
    private List<GameObject> YWanimationInstancings = new();

    private void Awake()
    {
        Application.targetFrameRate = 60;
    }

    private void OnGUI()
    {
        GUILayout.BeginArea(new Rect(100, 100, 300, 2000));

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

        GUILayout.Label("当前airenzhanshi_skin_Group数量：" + YWanimationInstancings.Count);
        GUILayout.Space(10);

        GUILayout.Label("当前AnimationInstance数量：" + (YWanimationInstancings.Count * 3 + animationInstancings.Count));
        int frameRate = (int)(1.0f / Time.smoothDeltaTime);
        GUILayout.Label("Frame Rate: " + frameRate.ToString());
        GUILayout.Label("Tris: " + UnityStats.triangles);
        GUILayout.Label("Verts: " + UnityStats.vertices);
        GUILayout.Label("Batches: " + UnityStats.batches);

        GUILayout.EndArea();
    }

}
