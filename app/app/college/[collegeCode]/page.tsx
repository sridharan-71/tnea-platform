import { getCollegeByCode } from "@/lib/repositories/collegeRepository";

interface CollegePageProps {
  params: Promise<{
    collegeCode: string;
  }>;
}

export default async function CollegePage({
  params,
}: CollegePageProps) {
  const { collegeCode } = await params;

  const college = await getCollegeByCode(Number(collegeCode));

  if (!college) {
    return (
      <main className="min-h-screen flex items-center justify-center">
        <h1 className="text-3xl font-bold">College not found</h1>
      </main>
    );
  }

  return (
    <main className="min-h-screen bg-gray-100">
      <div className="mx-auto max-w-5xl px-6 py-16">

        <div className="rounded-3xl bg-white p-10 shadow-lg">

          <p className="text-sm uppercase tracking-wider text-blue-600 font-semibold">
            College Profile
          </p>

          <h1 className="mt-4 text-5xl font-bold text-gray-900">
            {college.college_name}
          </h1>

          <div className="mt-8 grid gap-6 md:grid-cols-3">

            <div className="rounded-xl border p-6">
              <p className="text-sm text-gray-500">College Code</p>
              <p className="mt-2 text-2xl font-bold">
                {college.college_code}
              </p>
            </div>

            <div className="rounded-xl border p-6">
              <p className="text-sm text-gray-500">District</p>
              <p className="mt-2 text-2xl font-bold">
                {college.district}
              </p>
            </div>

            <div className="rounded-xl border p-6">
              <p className="text-sm text-gray-500">College Type</p>
              <p className="mt-2 text-xl font-bold">
                {college.college_type}
              </p>
            </div>

          </div>

        </div>
      </div>
    </main>
  );
}